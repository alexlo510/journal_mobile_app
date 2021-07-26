import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:journal/components/drop_down_rating_form_field.dart';
import 'package:journal/db/journal_entry_dto.dart';

class JournalEntryForm extends StatefulWidget {
  @override
  _JournalEntryFormState createState() => _JournalEntryFormState();
}

class _JournalEntryFormState extends State<JournalEntryForm> {

  final formKey = GlobalKey<FormState>();
  final journalEntryValues = JournalEntryDTO();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            titleFormField(journalEntryValues: journalEntryValues),
            bodyFormField(journalEntryValues: journalEntryValues),
            DropdownRatingFormField(
              maxRating: 4,
              onSaved: (value) {
                journalEntryValues.rating = value;
              },
              validator: (value) => (value == null) ? 'Please enter a Rating' : null, 
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:[
                cancelButton(context: context),
                saveButton(
                  context: context,
                  formKey: formKey,
                  journalEntryValues: journalEntryValues,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget titleFormField({required JournalEntryDTO journalEntryValues}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: TextFormField(
      autofocus: true,
      decoration: InputDecoration(
          labelText: 'Title',
          border: OutlineInputBorder(),
      ),
      onSaved: (value) {
        journalEntryValues.title = value;
      },
      validator: (value) => (value!.isEmpty) ? 'Please enter a Title' :  null,
    ),
  );
}

Widget bodyFormField({required JournalEntryDTO journalEntryValues}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: TextFormField(
      decoration: InputDecoration(
          labelText: 'Body',
          border: OutlineInputBorder(),
      ),
      onSaved: (value) {
        journalEntryValues.body = value;
      },
      validator: (value) => (value!.isEmpty) ? 'Please enter a Body' :  null,
    ),
  );
}

Widget cancelButton({required BuildContext context}) {
  return ElevatedButton(
    onPressed: () => Navigator.of(context).pop(), 
    child: Text('Cancel'),
    style: ElevatedButton.styleFrom(
      primary: Colors.grey,
      onPrimary: Colors.black,
    ),
  );
}

Widget saveButton({required BuildContext context, required dynamic formKey, required JournalEntryDTO journalEntryValues}) {
  return ElevatedButton(
    onPressed: () async {
      if (formKey.currentState.validate()){
        formKey.currentState.save();
        addDateToJournalEntryValues(journalEntryValues: journalEntryValues);
        // do database work here
        await deleteDatabase('journal.sqlite3.db');
        final Database database = await openDatabase(
          'journal.sqlite3.db',
          version: 1,
          onCreate: (Database db, int version) async {
            await db.execute('CREATE TABLE IF NOT EXISTS journal_entries(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT NOT NULL, body TEXT NOT NULL, rating INTEGER NOT NULL, date TEXT NOT NULL)');
          }
        );
        await database.transaction((txn) async {
          await txn.rawInsert('INSERT INTO journal_entries(title, body, rating, date) VALUES(?, ?, ?, ?)',
            [journalEntryValues.title, journalEntryValues.body, journalEntryValues.rating, journalEntryValues.dateTime]
          ); 
        });
        await database.close();
        //
        Navigator.of(context).pop();
      }
    }, 
    child: Text('Save'),
    style: ElevatedButton.styleFrom(
      primary: Colors.grey[300],
      onPrimary: Colors.black,
    )
  );
}

void addDateToJournalEntryValues({required JournalEntryDTO journalEntryValues}) {
  journalEntryValues.dateTime = DateTime.now();
}
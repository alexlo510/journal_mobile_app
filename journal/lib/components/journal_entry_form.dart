import 'package:flutter/material.dart';
import 'package:journal/components/drop_down_rating_form_field.dart';
import 'package:journal/db/database_manager.dart';
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
    Function loadJournal = ModalRoute.of(context)?.settings.arguments as Function;

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
                  loadJournal: loadJournal,
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

Widget saveButton({required BuildContext context, required dynamic formKey, required JournalEntryDTO journalEntryValues, required Function loadJournal}) {
  return ElevatedButton(
    onPressed: () async {
      if (formKey.currentState.validate()){
        formKey.currentState.save();
        addDateToJournalEntryValues(journalEntryValues: journalEntryValues);
        // do database work here
        final databaseManager = DatabaseManager.getInstance();
        databaseManager.saveJournalEntry(dto: journalEntryValues);
        //
        loadJournal();
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
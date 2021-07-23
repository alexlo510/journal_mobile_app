import 'package:flutter/material.dart';
import 'package:journal/components/drop_down_rating_form_field.dart';
import 'package:journal/models/journal_entry_fields.dart';

class JournalEntryForm extends StatefulWidget {
  @override
  _JournalEntryFormState createState() => _JournalEntryFormState();
}

class _JournalEntryFormState extends State<JournalEntryForm> {

  final formKey = GlobalKey<FormState>();
  final journalEntryFields = JournalEntryFields();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            titleFormField(journalEntryFields: journalEntryFields),
            bodyFormField(journalEntryFields: journalEntryFields),
            DropdownRatingFormField(
              maxRating: 4,
              onSaved: (value) {
                journalEntryFields.rating = value;
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
                  journalEntryFields: journalEntryFields,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget titleFormField({required JournalEntryFields journalEntryFields}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: TextFormField(
      autofocus: true,
      decoration: InputDecoration(
          labelText: 'Title',
          border: OutlineInputBorder(),
      ),
      onSaved: (value) {
        journalEntryFields.title = value;
      },
      validator: (value) => (value!.isEmpty) ? 'Please enter a Title' :  null,
    ),
  );
}

Widget bodyFormField({required JournalEntryFields journalEntryFields}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: TextFormField(
      decoration: InputDecoration(
          labelText: 'Body',
          border: OutlineInputBorder(),
      ),
      onSaved: (value) {
        journalEntryFields.body = value;
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

Widget saveButton({required BuildContext context, required dynamic formKey, required JournalEntryFields journalEntryFields}) {
  return ElevatedButton(
    onPressed: () {
      if (formKey.currentState.validate()){
        formKey.currentState.save();
        // do database work here
        print(journalEntryFields.toString()); // remove this later
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

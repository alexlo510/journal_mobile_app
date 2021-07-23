import 'package:flutter/material.dart';
import 'package:journal/components/drop_down_rating_form_field.dart';

class JournalEntryForm extends StatefulWidget {
  @override
  _JournalEntryFormState createState() => _JournalEntryFormState();
}

class _JournalEntryFormState extends State<JournalEntryForm> {

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            titleFormField(),
            bodyFormField(),
            DropdownRatingFormField(
              maxRating: 4,
              onSaved: (value) {},
              validator: (value) => (value == null) ? 'Please enter a Rating' : null, 
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:[
                cancelButton(context: context),
                saveButton(
                  context: context,
                  formKey: formKey,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget titleFormField() {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: TextFormField(
      autofocus: true,
      decoration: InputDecoration(
          labelText: 'Title',
          border: OutlineInputBorder(),
      ),
      onSaved: (value) {

      },
      validator: (value) => (value!.isEmpty) ? 'Please enter a Title' :  null,
    ),
  );
}

Widget bodyFormField() {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: TextFormField(
      decoration: InputDecoration(
          labelText: 'Body',
          border: OutlineInputBorder(),
      ),
      onSaved: (value) {

      },
      validator: (value) => (value!.isEmpty) ? 'Please enter a Body' :  null,
    ),
  );
}

// Widget ratingFormField() {
//   return TextFormField(
//     //autofocus: true,
//     decoration: InputDecoration(
//         labelText: 'Rating',
//         border: OutlineInputBorder(),
//     ),
//     onSaved: (value) {

//     },
//     validator: (value) {
//       if (value!.isEmpty) {
//         return 'Please enter a rating';
//       } else {
//         return null;
//       }
//     }
//   );
// }

Widget cancelButton({required BuildContext context}) {
  return ElevatedButton(
    onPressed: () => Navigator.pop(context), 
    child: Text('Cancel'),
    style: ElevatedButton.styleFrom(
      primary: Colors.grey,
      onPrimary: Colors.black,
    ),
  );
}

Widget saveButton({required BuildContext context, required dynamic formKey}) {
  return ElevatedButton(
    onPressed: () {
      if (formKey.currentState.validate()){
        formKey.currentState.save();
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

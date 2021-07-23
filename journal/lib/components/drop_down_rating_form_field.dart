import 'package:flutter/material.dart';

// code used from https://gist.github.com/ybakos/2769781ecd6844a38c37f4e751f41761 as mentioned in
// the project instructions. Modified code slightly due to null safety.
class DropdownRatingFormField extends StatefulWidget {

  final int maxRating;
  final void Function(dynamic) onSaved;
  final String? Function(dynamic) validator;

  DropdownRatingFormField({
    Key? key,
    required this.maxRating,
    required this.onSaved,
    required this.validator
    }) : super(key: key);

  @override
  DropdownRatingFormFieldState createState() => DropdownRatingFormFieldState();
}

class DropdownRatingFormFieldState extends State<DropdownRatingFormField> {

  int? selectedValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<dynamic>(
        value: selectedValue,
        items:  ratingMenuItems(maxRating: widget.maxRating),
        onChanged: (value) {
          setState( () => selectedValue = value as int);
        },
        decoration: InputDecoration(
          labelText: 'Rating',
          border: OutlineInputBorder()
        ),
        validator: widget.validator,
        onSaved: widget.onSaved
      );
  }

  List<DropdownMenuItem> ratingMenuItems({required int maxRating}) {
    return List<DropdownMenuItem<int>>.generate(maxRating, (i) {
      return DropdownMenuItem<int>(value: i+1, child: Text('${i+1}'));
    });
  }

}
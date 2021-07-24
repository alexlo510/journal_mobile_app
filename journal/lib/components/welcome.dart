import 'package:flutter/material.dart';

Widget welcome(BuildContext context) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:[
        SizedBox(
          height: 100,
          width: 100,
          child: FittedBox(
            child: Icon(
              Icons.book)
          )
        ),
        Text('Journal'),
      ],
    ),
  );
}

// double heightPadding(BuildContext context, paddingSize) {
//   if (MediaQuery.of(context).orientation == Orientation.landscape) {
//     return MediaQuery.of(context).size.height * 5 * paddingSize;
//   } else {
//     return MediaQuery.of(context).size.height * paddingSize;
//   }
// }

// double widthPadding(BuildContext context, paddingSize) {
//   if (MediaQuery.of(context).orientation == Orientation.landscape) {
//     return MediaQuery.of(context).size.width * 0.2 * paddingSize;
//   } else {
//     return MediaQuery.of(context).size.width * paddingSize;
//   }
// }
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
import 'package:flutter/material.dart';

Widget openSettings() {
  return Builder(builder: (context) {
    return IconButton(
      icon: Icon(Icons.settings),
      onPressed: () => Scaffold.of(context).openEndDrawer(),);
  });
}
import 'package:flutter/material.dart';

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('')),
        body: LayoutBuilder(builder: layoutDecider),
      ),
    );
  }

  Widget layoutDecider(BuildContext context, BoxConstraints constraints) =>
    constraints.maxWidth < 800 ? VerticalLayout() : HorizontalLayout();
}

class VerticalLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('Vertical');
  }
}

class HorizontalLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('Horizontal');
  }
}
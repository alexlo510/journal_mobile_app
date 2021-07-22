import 'package:flutter/material.dart';

class JournalEntryList extends StatelessWidget {

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Journal Entry List')),
      body: LayoutBuilder(builder: layoutDecider),
      floatingActionButton: FloatingActionButton(
        child : Icon(Icons.add),
        onPressed: () {},
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
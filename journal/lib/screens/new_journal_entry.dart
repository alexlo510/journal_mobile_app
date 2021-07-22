import 'package:flutter/material.dart';

class NewJournalEntry extends StatelessWidget {

  static const routeName = 'newJournalEntry';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('New Journal Entry')),
      body: Text('New Journal Entry'),
    );
  }
}
import 'package:flutter/material.dart';

class JournalEntry extends StatelessWidget {

  static const routeName = 'journalEntry';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Journal Entry')),
      body: Text('Journal Entry'),
    );
  }
}

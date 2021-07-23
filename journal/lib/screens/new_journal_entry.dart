import 'package:flutter/material.dart';
import 'package:journal/components/journal_drawer.dart';
import 'package:journal/components/journal_scaffold.dart';

class NewJournalEntry extends StatelessWidget {

  static const routeName = 'newJournalEntry';
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        //leading: Icon(Icons.ac_unit),
        title: Text('New Journal Entry'),
        actions: [openSettings()],
      ),
      endDrawer: LayoutBuilder(builder: (context, constraints) => drawerDecider(context, constraints)),
      body: Text('New Journal Entry'),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:journal/components/journal_drawer.dart';
import 'package:journal/components/journal_scaffold.dart';
import 'package:journal/screens/journal_entry_list.dart';

class NewJournalEntry extends StatelessWidget {

  static const routeName = 'newJournalEntry';
  
  @override
  Widget build(BuildContext context) {

    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    
    return Scaffold(
      appBar: AppBar(
        //leading: Icon(Icons.ac_unit),
        title: Text('New Journal Entry'),
        actions: [openSettings()],
      ),
      endDrawer: LayoutBuilder(builder: (context, constraints) => drawerDecider(context, constraints, args.darkMode, args.toggleTheme)),
      body: Text('New Journal Entry'),
    );
  }
}


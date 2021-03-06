import 'package:flutter/material.dart';
import 'package:journal/components/journal_drawer.dart';
import 'package:journal/components/journal_entry_form.dart';
import 'package:journal/components/journal_scaffold.dart';

class NewJournalEntry extends StatelessWidget {

  static const routeName = 'newJournalEntry';
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('New Journal Entry'),
        actions: [openSettings()],
      ),
      endDrawer: LayoutBuilder(builder: drawerDecider),
      body: SafeArea(
        child: JournalEntryForm()
      ),
    );
  }
}



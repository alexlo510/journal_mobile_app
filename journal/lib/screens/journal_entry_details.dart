import 'package:flutter/material.dart';
import 'package:journal/components/journal_drawer.dart';
import 'package:journal/components/journal_scaffold.dart';
import 'package:journal/models/journal_entry.dart';

class JournalEntryDetailsScreen extends StatelessWidget {

  static const routeName = 'journalEntry';

  @override
  Widget build(BuildContext context) {
    final journalEntry = ModalRoute.of(context)?.settings.arguments as JournalEntry;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Journal Entry'),
        actions: [openSettings()],
      ),
      endDrawer: LayoutBuilder(builder: drawerDecider),
      body: journalEntryDetails(context, journalEntry),
    );
  }

}

Widget journalEntryDetails(BuildContext context, JournalEntry journalEntry) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('${journalEntry.title}'),
          Text('${journalEntry.body}')
        ],
      ),
    );
}
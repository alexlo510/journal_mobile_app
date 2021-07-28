import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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

Widget journalEntryDetails(BuildContext context, JournalEntry? journalEntry) {
    return SafeArea(
          child: Padding(
        padding: (MediaQuery.of(context).orientation == Orientation.portrait) ? EdgeInsets.all(10) : EdgeInsets.only(top: 10, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Text(
                '${journalEntry?.title}',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            Text('${DateFormat('EEEE, MMMM d, yyyy').format(journalEntry?.dateTime as DateTime)}'),
            Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Text('Rating: ${journalEntry?.rating}'),
            ),
            Text('${journalEntry?.body}'),
          ],
        ),
      ),
    );
}
import 'package:flutter/material.dart';
import 'package:journal/screens/new_journal_entry.dart';
import 'package:journal/components/journal_drawer.dart';
import 'package:journal/components/journal_scaffold.dart';

class JournalEntryList extends StatelessWidget {

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: LayoutBuilder(builder: drawerDecider),
      appBar: AppBar(
        title: Text('Journal Entry List'),
        actions: [openSettings()],
      ),
      body: LayoutBuilder(builder: layoutDecider),
      floatingActionButton: FloatingActionButton(
        child : Icon(Icons.add),
        onPressed: () {pushNewJournalEntry(context);},
      ),
    );
  }

  Widget layoutDecider(BuildContext context, BoxConstraints constraints) =>
    constraints.maxWidth < 800 ? VerticalLayout(): HorizontalLayout();

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

void pushNewJournalEntry(BuildContext context) {
  Navigator.of(context).pushNamed(NewJournalEntry.routeName);
}

import 'package:flutter/material.dart';
import 'package:journal/screens/new_journal_entry.dart';

class JournalEntryList extends StatelessWidget {

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(),
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
    constraints.maxWidth < 800 ? VerticalLayout() : HorizontalLayout();

}

Widget openSettings() {
  return Builder(builder: (context) {
    return IconButton(
      icon: Icon(Icons.settings),
      onPressed: () => Scaffold.of(context).openEndDrawer(),);
  });
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
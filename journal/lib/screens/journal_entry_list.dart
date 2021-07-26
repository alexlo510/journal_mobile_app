import 'package:flutter/material.dart';
import 'package:journal/screens/new_journal_entry.dart';
import 'package:journal/screens/journal_entry_details.dart';
import 'package:journal/components/journal_drawer.dart';
import 'package:journal/components/journal_scaffold.dart';
import 'package:journal/components/welcome.dart';
import 'package:journal/models/journal.dart';
import 'package:journal/models/journal_entry.dart'; // will use when loading db

class JournalEntryList extends StatefulWidget {

  static const routeName = '/';

  @override
  _JournalEntryListState createState() => _JournalEntryListState();
}

class _JournalEntryListState extends State<JournalEntryList> {

  Journal? journal;

  void initState() {
    super.initState();
    //journal = Journal.fake(); //use as test
    journal = Journal.empty(); //use as test
    // journal = Journal(
    //   journalEntriesList: [
    //     JournalEntry(
    //       title: 'Test Title',
    //       body: 'Test Body',
    //       rating: 1,
    //     )
    //   ]
    // ); //use as test
    print(journal?.journalEntriesList); //remove 
  }

  void loadJournal(){
    // insert loading journal stuff here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: LayoutBuilder(builder: drawerDecider),
      appBar: AppBar(
        title: journal?.isEmpty ? Text('Welcome') : Text('Journal Entry List'),
        actions: [openSettings()],
      ),
      body: journal?.isEmpty ? welcome(context) : LayoutBuilder(builder: layoutDecider),
      floatingActionButton: FloatingActionButton(
        child : Icon(Icons.add),
        onPressed: () {displayNewJournalEntry(context);},
      ),
    );
  }

  Widget layoutDecider(BuildContext context, BoxConstraints constraints) =>
    constraints.maxWidth < 800 ? JournalEntryListPageBody(context): HorizontalLayout(leftWidget: JournalEntryListPageBody(context), rightWidget: Text('test'));

  Widget JournalEntryListPageBody(BuildContext context) {
    return ListView.builder(
      itemCount: journal?.numberOfEntries,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('${journal?.journalEntriesList[index].title}'),
          subtitle: Text('${journal?.journalEntriesList[index].dateTime}'),
          onTap: () {displayJournalEntryDetails(context, journal?.journalEntriesList[index]);},
        );
      },
    );
  }

}

class VerticalLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('Vertical');
  }
}

class HorizontalLayout extends StatefulWidget {

  final leftWidget;
  final rightWidget;

  HorizontalLayout({
    required this.leftWidget,
    required this.rightWidget,
  });

  @override
  _HorizontalLayoutState createState() => _HorizontalLayoutState();
}

class _HorizontalLayoutState extends State<HorizontalLayout> {
  @override
  Widget build(BuildContext context) {
    return Text('Horizontal');
  }
}

void displayNewJournalEntry(BuildContext context) {
  Navigator.of(context).pushNamed(NewJournalEntry.routeName);
}

void displayJournalEntryDetails(BuildContext context, JournalEntry? journalEntry) {
  Navigator.of(context).pushNamed(JournalEntryDetailsScreen.routeName, arguments: journalEntry);
}

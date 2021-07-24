import 'package:flutter/material.dart';
import 'package:journal/screens/new_journal_entry.dart';
import 'package:journal/components/journal_drawer.dart';
import 'package:journal/components/journal_scaffold.dart';
import 'package:journal/models/journal.dart';
import 'package:journal/models/journal_entry.dart';

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
    //journal = Journal.empty(); //use as test
    journal = Journal(
      journalEntriesList: [
        JournalEntry(
          title: 'Test Title',
          body: 'Test Body',
          rating: 1,
        )
      ]
    ); //use as test
    print(journal?.journalEntriesList); //remove 
  }

  void loadJournal(){

  }

  @override
  Widget build(BuildContext context) {
    print(journal?.journalEntriesList);
    return Scaffold(
      endDrawer: LayoutBuilder(builder: drawerDecider),
      appBar: AppBar(
        title: journal?.isEmpty ? Text('Welcome') : Text('Journal Entry List'),
        actions: [openSettings()],
      ),
      body: journal?.isEmpty ? Text('Welcome') : LayoutBuilder(builder: layoutDecider), // put welcome page in place of text
      floatingActionButton: FloatingActionButton(
        child : Icon(Icons.add),
        onPressed: () {pushNewJournalEntry(context);},
      ),
    );
  }

  Widget layoutDecider(BuildContext context, BoxConstraints constraints) =>
    constraints.maxWidth < 800 ? VerticalLayout(): HorizontalLayout();

  // Widget JournalEntryListPageBody(BuildContext context) {
  //   return ListView.builder(
  //     itemCount: ,
  //   );
  // }

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

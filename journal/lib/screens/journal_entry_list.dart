import 'package:flutter/material.dart';
import 'package:journal/screens/new_journal_entry.dart';
import 'package:journal/screens/journal_entry_details.dart';
import 'package:journal/components/journal_drawer.dart';
import 'package:journal/components/journal_scaffold.dart';
import 'package:journal/components/welcome.dart';
import 'package:journal/db/database_manager.dart';
import 'package:journal/db/journal_entry_dao.dart';
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
    // journal = Journal(
    //   journalEntriesList: [
    //     JournalEntry(
    //       title: 'Test Title',
    //       body: 'Test Body',
    //       rating: 1,
    //       dateTime: DateTime.now()
    //     )
    //   ]
    // ); //use as test
    loadJournal();
  }

  void loadJournal() async {
    final databaseManager = DatabaseManager.getInstance();
    List<JournalEntry> journalEntries = await JournalEntryDAO.journalEntries(databaseManager: databaseManager);
    print(journalEntries);
    setState( () {
      journal = Journal(journalEntriesList: journalEntries);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (journal == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Loading...'),
          ),
        body: Center(child: CircularProgressIndicator()),
      );
    }
    return Scaffold(
      endDrawer: LayoutBuilder(builder: drawerDecider),
      appBar: AppBar(
        title: journal?.isEmpty ? Text('Welcome') : Text('Journal Entry List'),
        actions: [openSettings()],
      ),
      body: journal?.isEmpty ? welcome(context) : LayoutBuilder(builder: layoutDecider),
      floatingActionButton: FloatingActionButton(
        child : Icon(Icons.add),
        onPressed: () {displayNewJournalEntry(context, loadJournal);},
      ),
    );
  }

  Widget layoutDecider(BuildContext context, BoxConstraints constraints) =>
    constraints.maxWidth < 800 ? JournalEntryListPageBody(context, constraints, journal): 
    HorizontalJournalEntryListLayout(journal: journal, constraints: constraints);

  // Widget JournalEntryListPageBody(BuildContext context) {
  //   return ListView.builder(
  //     itemCount: journal?.numberOfEntries,
  //     itemBuilder: (context, index) {
  //       return ListTile(
  //         title: Text('${journal?.journalEntriesList[index].title}'),
  //         subtitle: Text('${journal?.journalEntriesList[index].dateTime}'),
  //         onTap: () {displayJournalEntryDetails(context, journal?.journalEntriesList[index]);},
  //       );
  //     },
  //   );
  // }
}

Widget JournalEntryListPageBody(BuildContext context, BoxConstraints constraints, Journal? journal, {Function? action}) {
  return ListView.builder(
    itemCount: journal?.numberOfEntries,
    itemBuilder: (context, index) {
      return ListTile(
        title: Text('${journal?.journalEntriesList[index].title}'),
        subtitle: Text('${journal?.journalEntriesList[index].dateTime}'), // NEED TO ADD A FUNCTION TO PARSE THIS LATER
        onTap: (constraints.maxWidth < 800) ? () {displayJournalEntryDetails(context, journal?.journalEntriesList[index]);} :
                (){action!(index);},
      );
    },
  );
}

// class VerticalLayout extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Text('Vertical');
//   }
// }

class HorizontalJournalEntryListLayout extends StatefulWidget {

  final Journal? journal;
  final BoxConstraints constraints;

  HorizontalJournalEntryListLayout({
    required this.constraints,
    required this.journal,
  });

  @override
  _HorizontalJournalEntryListLayoutState createState() => _HorizontalJournalEntryListLayoutState();
}

class _HorizontalJournalEntryListLayoutState extends State<HorizontalJournalEntryListLayout> {

  var journalIndex = 0;

  void settingState(index){
    setState(() {
      journalIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: JournalEntryListPageBody(context, widget.constraints, widget.journal, action: settingState)),
        Expanded(child: journalEntryDetails(context, widget.journal?.journalEntriesList[journalIndex])),
      ],
    );
  }
}

void displayNewJournalEntry(BuildContext context, Function args) {
    Navigator.of(context).pushNamed(NewJournalEntry.routeName, arguments: args);
}

void displayJournalEntryDetails(BuildContext context, JournalEntry? journalEntry) {
  Navigator.of(context).pushNamed(JournalEntryDetailsScreen.routeName, arguments: journalEntry);
}

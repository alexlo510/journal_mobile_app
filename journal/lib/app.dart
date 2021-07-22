import 'package:flutter/material.dart';
import 'package:journal/screens/journal_entry.dart';
import 'package:journal/screens/journal_entry_list.dart';
import 'package:journal/screens/new_journal_entry.dart';

class App extends StatefulWidget {

  static final routes = {
    //JournalEntryList.routeName: (context) => JournalEntryList(),
    JournalEntry.routeName: (context) => JournalEntry(),
    NewJournalEntry.routeName: (context) => NewJournalEntry(),
  };

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {

  bool darkMode = false;

  void toggleTheme (bool value) {
    setState( () {
      darkMode = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Journal',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: darkMode ? ThemeMode.dark: ThemeMode.light,
      routes: App.routes,
      home: JournalEntryList(darkMode: darkMode, toggleTheme: toggleTheme),
    );
  }
}

// Widget layoutDecider(BuildContext context, BoxConstraints constraints) =>
//     constraints.maxWidth < 800 ? VerticalLayout() : HorizontalLayout();

// class VerticalLayout extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Text('Vertical');
//   }
// }

// class HorizontalLayout extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Text('Horizontal');
//   }
// }
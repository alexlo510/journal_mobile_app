import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:journal/screens/journal_entry_details.dart';
import 'package:journal/screens/journal_entry_list.dart';
import 'package:journal/screens/new_journal_entry.dart';


class App extends StatefulWidget {

  static final routes = {
    JournalEntryList.routeName: (context) => JournalEntryList(),
    JournalEntryDetailsScreen.routeName: (context) => JournalEntryDetailsScreen(),
    NewJournalEntry.routeName: (context) => NewJournalEntry(),
  };

  final SharedPreferences preferences;

  App({
    Key? key,
    required this.preferences,
  }): super(key: key);

  @override
  AppState createState() => AppState();
}

class AppState extends State<App> {

  static const DARK_MODE_KEY = 'darkMode';

  bool get darkMode => widget.preferences.getBool(DARK_MODE_KEY) ?? false;

  void toggleTheme (bool value) {
    setState( () {
      widget.preferences.setBool(DARK_MODE_KEY, value);
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
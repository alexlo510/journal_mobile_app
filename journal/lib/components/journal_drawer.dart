import 'package:flutter/material.dart';
import 'package:journal/app.dart';

Widget drawerDecider(BuildContext context, BoxConstraints constraints) =>
    constraints.maxWidth < 800 ? verticalDrawer(context, drawer(context)) : drawer(context);

Widget verticalDrawer(BuildContext context, Widget drawer){
  return Container(
    width: MediaQuery.of(context).size.width * 0.75,
    child: drawer,
  );
}

Widget drawer(BuildContext context){
  return Drawer(
    child: ListView(
      children: [
        Container(
          height: 55,
          child: DrawerHeader(
            child: Text('Settings')
          ),
        ),
        darkModeToggle(),
      ],
    ),
  );
}

class darkModeToggle extends StatefulWidget {

  @override
  _darkModeState createState() => _darkModeState();
}

class _darkModeState extends State<darkModeToggle> {
  
  @override
  Widget build(BuildContext context) {

    AppState? appState = context.findAncestorStateOfType<AppState>();

    return SwitchListTile(
      title: const Text('Dark Mode'),
      value: appState!.darkMode,
      onChanged: appState.toggleTheme,
    );
  }
}
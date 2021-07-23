import 'package:flutter/material.dart';

Widget drawerDecider(BuildContext context, BoxConstraints constraints, bool darkMode, Function toggleTheme) =>
    constraints.maxWidth < 800 ? verticalDrawer(context, drawer(context, darkMode, toggleTheme)) : drawer(context, darkMode, toggleTheme);

Widget verticalDrawer(BuildContext context, Widget drawer){
  return Container(
    width: MediaQuery.of(context).size.width * 0.75,
    child: drawer,
  );
}

Widget drawer(BuildContext context, bool darkMode, Function toggleTheme){
  return Drawer(
    child: ListView(
      children: [
        Container(
          height: 55,
          child: DrawerHeader(
            child: Text('Settings')
          ),
        ),
        darkModeToggle(darkMode: darkMode, toggleTheme: toggleTheme),
      ],
    ),
  );
}

class darkModeToggle extends StatefulWidget {

  final darkMode;
  final toggleTheme;

  darkModeToggle({
    Key? key,
    this.darkMode,
    this.toggleTheme,
  }) : super(key: key);

  @override
  _darkModeState createState() => _darkModeState();
}

class _darkModeState extends State<darkModeToggle> {
  
  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: const Text('Dark Mode'),
      value: widget.darkMode,
      onChanged: widget.toggleTheme,
    );
  }
}
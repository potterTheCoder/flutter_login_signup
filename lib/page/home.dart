import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_login_signup/listview/random_words.dart' as randomWordsList;
import 'package:flutter_login_signup/page/login.dart';
import 'package:flutter_login_signup/utils/prefs.dart';
import 'package:flutter_login_signup/utils/pupup_menu.dart';
import 'package:flutter_login_signup/utils/theme.dart';
import 'package:flutter_login_signup/utils/toast.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: myTheme[AppTheme.values[0]],
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  void _popUpMenu(String choice) {
    if (choice == PopUpMenu.Logout) {
      spClear();
      showToast('You logged out!');
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => LoginPage()));
    } else if (choice == PopUpMenu.Exit) {
      exit(0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: color.shade50,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(40.0),
          child: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: Text('Home Screen', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white)),
            actions: <Widget>[
              PopupMenuButton<String>(
                onSelected: _popUpMenu,
                itemBuilder: (BuildContext context) {
                  return PopUpMenu.choices.map((String choice) {
                    return PopupMenuItem<String>(
                      value: choice,
                      child: Text(choice, style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18, color: color.shade700)),
                    );
                  }).toList();
                },
              )
            ],
          )),
      body: Container(
        child: Scrollbar(child: randomWordsList.RandomWordsListView()),
      ),
    );
  }
}

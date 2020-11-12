import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_login_signup/page/home.dart';
import 'package:flutter_login_signup/page/login.dart';
import 'package:flutter_login_signup/utils/prefs.dart';
import 'package:flutter_login_signup/utils/theme.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: myTheme[AppTheme.values[0]],
      home: Splash(),
    );
  }
}

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  bool _isLoggedIn = false;

  _getFirstLaunch() async {
    bool loginStatus = await spGetBool(keyLoggedIn);
    setState(() {
      _isLoggedIn = loginStatus;
    });
  }

  @override
  void initState() {
    super.initState();
    _getFirstLaunch();
    Timer(Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => _isLoggedIn ? HomePage() : LoginPage())));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: color.shade700),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 90.0,
                        child: Image.asset(
                          'raw/images/ic_logo.png',
                          width: 120.0,
                          height: 120.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      Text(
                        'Login Test',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 28.0),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(
                      backgroundColor: Colors.white24,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0, bottom: 20.0),
                    ),
                    Text(
                      'Loading, Please wait...!!',
                      softWrap: true,
                      textAlign: TextAlign.left,
                      style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18.0, fontStyle: FontStyle.italic, color: Colors.white),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

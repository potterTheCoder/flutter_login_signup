import 'package:flutter/material.dart';
import 'package:flutter_login_signup/page/home.dart';
import 'package:flutter_login_signup/utils/prefs.dart';
import 'package:flutter_login_signup/utils/theme.dart';
import 'package:flutter_login_signup/utils/toast.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: myTheme[AppTheme.values[0]],
      home: Login(),
    );
  }
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  String _email;
  String _password;
  final _formKey = GlobalKey<FormState>();

  _isValidEmail(String email) {
    bool isValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
    return isValid;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: color.shade700,
      body: Form(
        key: _formKey,
        child: Center(
          child: Padding(
              padding: EdgeInsets.all(10),
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Login Test',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white),
                      )),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: TextFormField(
                      cursorColor: color.shade300,
                      style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18, color: Colors.white),
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          labelText: "Email",
                          labelStyle: TextStyle(
                            color: Colors.white,
                          ),
                          errorStyle: TextStyle(
                            color: Colors.red,
                            fontSize: 16,
                          ),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
                      validator: (value) {
                        if (value.isEmpty)
                          return 'Email is empty';
                        else if (!_isValidEmail(value.toString()))
                          return "Invalid email";
                        else
                          return null;
                      },
                      onSaved: (val) => _email = val,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: TextFormField(
                      cursorColor: color.shade300,
                      style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18, color: Colors.white),
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: "Password",
                          labelStyle: TextStyle(
                            color: Colors.white,
                          ),
                          errorStyle: TextStyle(
                            color: Colors.red,
                            fontSize: 16,
                          ),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
                      validator: (value) {
                        if (value.isEmpty)
                          return 'Password is empty';
                        else if (value.length < 6)
                          return "Password contains 6 or more letters";
                        else
                          return null;
                      },
                      onSaved: (val) => _password = val,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 40,
                    width: 150,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                      textColor: color.shade700,
                      color: color.shade50,
                      child: Text('Login'),
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                          spPutBool(keyLoggedIn, true);
                          spPutString(keyEmail, _email);
                          spPutString(keyPassword, _password);
                          showToast('Yey, You logged In as $_email');
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => HomePage()));
                        }
                      },
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}

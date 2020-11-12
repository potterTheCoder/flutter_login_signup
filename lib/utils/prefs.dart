import 'package:shared_preferences/shared_preferences.dart';

const String keyLoggedIn = 'sp_logged_in';
const String keyEmail = 'sp_email';
const String keyPassword = 'sp_password';

spClear() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  await preferences.clear();
}

Future<bool> spPutInt(String key, int value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.setInt(key, value);
}

Future<int> spGetInt(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getInt(key) ?? 0;
}

Future<bool> spPutBool(String key, bool value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.setBool(key, value);
}

Future<bool> spGetBool(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool(key) ?? false;
}

Future<bool> spPutString(String key, String value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.setString(key, value);
}

Future<String> spGetString(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString(key) ?? "";
}

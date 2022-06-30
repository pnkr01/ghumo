import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ghumo/home/places/db.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../auth/service/authservices.dart';

SharedPreferences? sharedPreferences;
FirebaseAuth firebaseAuth = FirebaseAuth.instance;
AuthClass authClass = AuthClass();
Db db = Db();
void showSnackBar(BuildContext context, String text) {
  final snakbar = SnackBar(
    content: Text(text),
    behavior: SnackBarBehavior.floating,
  );
  ScaffoldMessenger.of(context).showSnackBar(snakbar);
}

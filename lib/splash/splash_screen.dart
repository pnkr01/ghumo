import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ghumo/auth/service/login_sign.dart';
import '../global/global.dart';
import '../home/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    setTimer();
  }

  void setTimer() {
    Timer(const Duration(seconds: 3), () {
      if (firebaseAuth.currentUser != null) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ),
            (route) => false);
      } else {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const LogInCumSignUpScreen(),
            ),
            (route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: size.height * 0.50,
          ),
          Center(
            child: Column(
              children: const [
                Text(
                  "Welcome To Ghumo ",
                  softWrap: true,
                  style: TextStyle(fontSize: 24.0),
                ),
                Text('Travel with Passion'),
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.15,
          ),
          const CircularProgressIndicator()
        ],
      ),
    );
  }
}

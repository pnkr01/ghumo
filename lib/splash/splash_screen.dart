import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ghumo/auth/service/login_sign.dart';
import 'package:google_fonts/google_fonts.dart';
import '../global/global.dart';
import '../home/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late Animation<Color?> animation;
  late AnimationController controller;
  @override
  void initState() {
    super.initState();
    // setTimer();
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animation = ColorTween(
      begin: const Color(0xFF3D383B),
      end: const Color.fromARGB(255, 142, 85, 50),
      // begin: Colors.red,
      // end: Colors.pink,
    ).animate(controller)
      ..addListener(() {
        setState(() {
          // The state that has changed here is the animation object’s value.
        });
      });

    animateColor();
    setTimer();
  }

  void animateColor() {
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void setTimer() {
    Timer(const Duration(seconds: 4), () {
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
      // backgroundColor: const Color(0xFF353132),
      backgroundColor: animation.value,
      body: Column(
        children: [
          SizedBox(
            height: size.height * 0.50,
          ),
          Center(
            child: Column(
              children: [
                Text(
                  "Ghumo ",
                  softWrap: true,
                  style: GoogleFonts.philosopher(
                    fontSize: 65.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Row(
                  children: [
                    SizedBox(width: MediaQuery.of(context).size.width / 2),
                    Text('Travel with Passion',
                        style: GoogleFonts.lobster(
                          color: Colors.cyan,
                        )),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.15,
          ),
          const CircularProgressIndicator(
            color: Colors.cyan,
            backgroundColor: Colors.white,
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:ghumo/auth/components/profile/profile_header.dart';
import 'package:ghumo/auth/components/profile/profilebody.dart';

class Profile extends StatelessWidget {
  final String phone;
  const Profile({
    Key? key,
    required this.phone,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          const ProfileHeader(),
          BuildProfileBody(phoneNumber: phone),
        ],
      ),
    );
  }
}

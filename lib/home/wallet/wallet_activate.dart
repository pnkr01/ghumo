import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ghumo/global/global.dart';
import 'package:ghumo/global/loading_dialog.dart';
import 'package:ghumo/home/wallet/wallet_main.dart';
import 'package:google_fonts/google_fonts.dart';

class WalletActivate extends StatelessWidget {
  const WalletActivate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF274C39),
      body: Column(
        children: [
          const SizedBox(
            height: 50.0,
          ),
          Image.asset('assets/images/aaaa.png'),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text('Activate you wallet to Enjoy',
                style: GoogleFonts.signika(
                  fontSize: 24.0,
                  color: Colors.white,
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: SizedBox(
              height: 60,
              width: MediaQuery.of(context).size.width * 0.75,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.amber,
                ),
                onPressed: () async {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return const LoadingDialog(message: "",);
                      });
                  await FirebaseFirestore.instance
                      .collection("phone")
                      .doc(sharedPreferences!.getString('phoneNumber'))
                      .update(
                        ({
                          'walletOpen': true,
                        }),
                      );
                  await sharedPreferences!
                      .setBool(
                    "walletOpen",
                    true,
                  )
                      .then((value) {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Wallet(),
                        ));
                  });
                },
                child: const Text(
                  'Activate Wallet',
                  style: TextStyle(fontSize: 14.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

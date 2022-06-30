import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../global/global.dart';
import 'details_page.dart';

class Db {
  void fetchdb(int index, BuildContext context) async {
    await FirebaseFirestore.instance
        .collection('near')
        .doc('1k6C1AtuumAZ81bVlgo5')
        .collection(sharedPreferences!.getString('dham') ?? 'Puri')
        .get()
        .then((snap) async {
      // print("kkkkkkkkkkkkkkkkkkk");
      //print(snap.docs[index]['rating']);
      await sharedPreferences!
          .setString('description', snap.docs[index]["desc"]);
      await sharedPreferences!.setString('img', snap.docs[index]["img"]);
      await sharedPreferences!.setString('rating', snap.docs[index]["rating"]);
      await sharedPreferences!.setString('title', snap.docs[index]["title"]);
      await sharedPreferences!.setString('charge', snap.docs[index]["charge"]);
    }).then((value) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailsPage(
            imgUrl:
                sharedPreferences!.getString('img') ?? 'error fetching imgUrl',
            title:
                sharedPreferences!.getString('title') ?? 'error fetching title',
            rating: sharedPreferences!.getString('rating') ??
                'error fetching rating',
            // guide: sharedPreferences!.getString('rating') ?? 'error fetching rating',,
            description: sharedPreferences!.getString('description') ??
                'error fetching description',
            charge: sharedPreferences!.getString('charge') ??
                'error fetching spending',
          ),
        ),
      );
    });
  }
}

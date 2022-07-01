import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../global/global.dart';
import '../pagination/shimmer_page.dart';
import 'package:ghumo/global/global.dart';

class NearHotel extends StatefulWidget {
  const NearHotel({Key? key}) : super(key: key);

  @override
  State<NearHotel> createState() => _NearHotelState();
}

class _NearHotelState extends State<NearHotel> {
  // _fetchdb(int index) async {
  //   await FirebaseFirestore.instance
  //       .collection('near')
  //       .doc('1k6C1AtuumAZ81bVlgo5')
  //       .collection(sharedPreferences!.getString('dham') ?? 'Puri')
  //       .get()
  //       .then((snap) async {
  //     // print("kkkkkkkkkkkkkkkkkkk");
  //      //print(snap.docs[index]['rating']);
  //     await sharedPreferences!
  //         .setString('description', snap.docs[index]["desc"]);
  //     await sharedPreferences!.setString('img', snap.docs[index]["img"]);
  //     await sharedPreferences!.setString('rating', snap.docs[index]["rating"]);
  //     await sharedPreferences!.setString('title', snap.docs[index]["title"]);
  //     await sharedPreferences!.setString('charge', snap.docs[index]["charge"]);
  //   }).then((value) {
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => DetailsPage(
  //           imgUrl:
  //               sharedPreferences!.getString('img') ?? 'error fetching imgUrl',
  //           title:
  //               sharedPreferences!.getString('title') ?? 'error fetching title',
  //           rating: sharedPreferences!.getString('rating') ??
  //               'error fetching rating',
  //           // guide: sharedPreferences!.getString('rating') ?? 'error fetching rating',,
  //           description: sharedPreferences!.getString('description') ??
  //               'error fetching description',
  //           charge: sharedPreferences!.getString('charge') ??
  //               'error fetching spending',
  //         ),
  //       ),
  //     );
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('hote_near')
            .doc('T8RZhZF8EmkEEdrGDaIc')
            .collection(sharedPreferences!.getString('dham') ?? 'Puri')
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          var totalPhotosCount = 0;
          List<DocumentSnapshot> documentLists;

          if (snapshot.hasData) {
            documentLists = snapshot.data.docs;
            totalPhotosCount = documentLists.length;
            if (kDebugMode) {
              print("llllllllllllllllllllllllll");
            }
            // print(snapshot.data!.docs[0].data()!['img']);
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: totalPhotosCount,
              padding: const EdgeInsets.all(2.0),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    db.fetchdb(index, context,'hote_near','T8RZhZF8EmkEEdrGDaIc');
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Container(
                      width: (width / 2) - 15,
                      height: 150,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15.0)),
                        image: DecorationImage(
                          image: NetworkImage(
                            documentLists[index]['img'],
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(0),
                        child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
                            gradient: LinearGradient(
                              colors: [
                                Colors.black,
                                Color(0x19000000),
                              ],
                              begin: FractionalOffset(0.0, 1.0),
                              end: FractionalOffset(0.0, 0.0),
                              stops: [0.0, 1.0],
                              tileMode: TileMode.clamp,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                documentLists[index]['title'],
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ), /* add child content here */
                    ),
                  ),
                );
              },
            );
          } else {
            return Expanded(
              child: ListView.separated(
                itemCount: 5,
                itemBuilder: (context, index) => const NewsCardSkelton(),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 16.0),
              ),
            );
          }
        });
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../global/global.dart';
import 'details_page.dart';

class PlacesTab extends StatefulWidget {
  const PlacesTab({Key? key}) : super(key: key);

  @override
  State<PlacesTab> createState() => _PlacesTabState();
}

class _PlacesTabState extends State<PlacesTab> {
  int activeIndex = 0;
  int indexing = 0;
  Stream? slides;
  List? slideList;
  _querydb() {
    String dham = sharedPreferences!.getString('dham') ?? 'Puri';
    slides = FirebaseFirestore.instance
        .collection('carousel')
        .doc('zvqim8TLgYcbYxnpKFJ6')
        .collection(dham)
        .snapshots()
        .map(
          (list) => list.docs.map(
            (doc) => doc.data(),
          ),
        );
  }

  _fetchdb(int index) async {
    await FirebaseFirestore.instance
        .collection('carousel')
        .doc('zvqim8TLgYcbYxnpKFJ6')
        .collection(sharedPreferences!.getString('dham') ?? 'Puri')
        .get()
        .then((snap) async {
      // print("kkkkkkkkkkkkkkkkkkk");
      // print(snap.docs[index]['rating']);
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

  @override
  void initState() {
    super.initState();
    _querydb();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.height,
      child: StreamBuilder(
        stream: slides,
        builder: (context, AsyncSnapshot snap) {
          if (snap.hasError) {
            const Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
              ),
            );
          }
          if (snap.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                backgroundColor: Color(0xffb196c4),
              ),
            );
          }
          slideList = snap.data.toList();
          return Stack(
            children: [
              CarouselSlider(
                items: slideList!.map(
                  (index) {
                    return Builder(
                      builder: (BuildContext context) {
                        return InkWell(
                          onTap: () {
                            _fetchdb(indexing);
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.symmetric(horizontal: 2.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Stack(
                                children: [
                                  Positioned.fill(
                                    child: CachedNetworkImage(
                                      fit: BoxFit.fill,
                                      imageUrl: index['img'],
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.error),
                                      placeholder: (context, url) =>
                                          const SizedBox(
                                        child: Center(
                                          child: CircularProgressIndicator(
                                            color: Colors.purple,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Text(
                                        index['title'],
                                        softWrap: true,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ).toList(),
                options: CarouselOptions(
                  onPageChanged: (index, reason) {
                    setState(
                      () {
                        activeIndex = index;
                        indexing = activeIndex;
                      },
                    );
                  },
                  pauseAutoPlayOnManualNavigate: true,
                  height: MediaQuery.of(context).size.height * 0.3,
                  aspectRatio: 16 / 9,
                  viewportFraction: 1,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: false,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 500),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              Positioned(
                bottom: MediaQuery.of(context).size.height * 0.03,
                left: MediaQuery.of(context).size.width * 0.3,
                child: CarouselIndicator(
                  color: Colors.blue,
                  count: slideList!.length,
                  index: activeIndex,
                ),
              ),


              //TODOS: DHAM CHANGE OPTION
              // Positioned(
              //   child: ElevatedButton(
              //     onPressed: () {
              //       setState(() {
              //         sharedPreferences!.setString('dham', 'Dwarka');
              //         print('sucess');
              //         _querydb();
              //       });
              //     },
              //     child: const Text("Change"),
              //   ),
              // ),
            ],
          );
        },
      ),
    );
  }
}

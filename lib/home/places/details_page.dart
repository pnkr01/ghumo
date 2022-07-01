// import 'package:flutter/material.dart';

// class DetailsPagePage extends StatelessWidget {
// final String imgUrl;
// final String title;
// final String rating;
// //final Map<String,int> guide;
// final String description;
// final String charge;
//   const DetailsPagePage({
//     Key? key,
// required this.imgUrl,
// required this.title,
// required this.rating,
// //required this.guide,
// required this.description,
// required this.charge,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Image.network(imgUrl),
//           Text(title),
//           Text(description),
//           Text(rating),
//           Text(charge),
//         ],
//       ),
//     );
//   }
// }

import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class DetailsPage extends StatefulWidget {
  final String imgUrl;
  final String title;
  final String rating;
  //final Map<String,int> guide;
  final String description;
  final String charge;
  const DetailsPage({
    Key? key,
    required this.imgUrl,
    required this.title,
    required this.rating,
    //required this.guide,
    required this.description,
    required this.charge,
  }) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage>
    with SingleTickerProviderStateMixin {
  void launchMap(String address) async {
    String query = Uri.encodeFull(address);
    String googleUrl = "https://www.google.com/maps/search/?api=1&query=$query";

      if (await canLaunchUrlString(googleUrl)) {
      await launchUrlString(googleUrl);
    } else {
      print('Could not launch $googleUrl');
      throw 'Could not launch $googleUrl';
    }
  }
  

  TextEditingController textController = TextEditingController();
  List reviews = [
    'hte',
    'kk',
    'kk',
    'kk',
    'kk',
    'kk',
    'kk',
    'kk',
    'kk',
    'kk',
    'kk',
    'kk',
    'kk',
    'kk',
    'kk',
    'kk',
    'kk',
    'kk',
    'kk',
    'kk',
    'kk',
    'kk',
    'kk',
    'kk',
    'kk',
    'kk',
    'kk',
    'kk',
  ];
  bool isTap = false;
  TabController? tabController;

  @override
  void initState() {
    // country = getCountrys();
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          child: Column(
            children: [
              Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl: widget.imgUrl,
                    height: 350,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const SizedBox(
                      child: Center(
                        child: CircularProgressIndicator(
                          color: Colors.purple,
                        ),
                      ),
                    ),
                  ),
                  // Image.network(
                  //   widget.imgUrl,
                  //   height: 350,
                  //   width: MediaQuery.of(context).size.width,
                  //   fit: BoxFit.cover,
                  // ),
                  Container(
                    height: 350,
                    color: Colors.black12,
                    padding: const EdgeInsets.only(top: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                            left: 24,
                            right: 24,
                          ),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: const SizedBox(
                                  child: Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                ),
                              ),
                              const Spacer(),
                              const Icon(
                                Icons.share,
                                color: Colors.white,
                                size: 24,
                              ),
                              const SizedBox(
                                width: 24,
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    isTap = !isTap;
                                  });
                                },
                                child: Icon(
                                  Icons.favorite,
                                  color: !isTap ? Colors.white : Colors.red,
                                  size: !isTap ? 24 : 27,
                                ),
                              )
                            ],
                          ),
                        ),
                        const Spacer(),
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomRight,
                              stops: const [0.0, 0.9],
                              colors: [
                                Colors.black.withOpacity(.8),
                                Colors.black.withOpacity(.0),
                              ],
                            ),
                          ),
                          padding: const EdgeInsets.only(
                            left: 24,
                            right: 24,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 24.0,
                              ),
                              Text(
                                widget.title,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 23),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  RatingBar(int.parse(widget.rating)),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    "${int.parse(widget.rating)}",
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 17,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 18.0,
                              )
                            ],
                          ),
                        ),
                        // const SizedBox(
                        //   height: 18,
                        // ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          height: 16,
                        )
                      ],
                    ),
                  )
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  widget.description,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    fontSize: 15,
                    height: 1.5,
                    fontWeight: FontWeight.w600,
                    color: Color(
                      0xff879D95,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                child: TabBar(
                  controller: tabController,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  tabs: const [
                    Tab(
                      text: "Reviews",
                    ),
                    Tab(
                      text: "Guides",
                    ),
                    Tab(
                      text: "Direction",
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: double.maxFinite,
                height: 500,
                child: TabBarView(
                  controller: tabController,
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: ListTile(
                                  leading: const CircleAvatar(
                                    child: Icon(
                                      Icons.person,
                                    ),
                                  ),
                                  title: TextField(
                                    controller: textController,
                                  ),
                                  trailing: ElevatedButton(
                                    onPressed: () {
                                      reviews.add(textController.text);
                                    },
                                    child: const Text("Send"),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 16.0,
                          ),
                          ListBody(
                            children: List.generate(
                                3,
                                (index) => ListTile(
                                      leading: const CircleAvatar(),
                                      title:
                                          Text(reviews[Random().nextInt(10)]),
                                    )
                                //  Column(
                                //   children: const [
                                //     Divider(
                                //       thickness: 1,
                                //     ),
                                //     ListTile(
                                //       leading: CircleAvatar(
                                //         child: Icon(Icons.person),
                                //       ),
                                //       title: Text(
                                //         'A place of great value and intrest, amazing experience',
                                //       ),
                                //     ),
                                //     Divider(
                                //       thickness: 1,
                                //     ),
                                //   ],
                                // ),
                                ),
                          ),
                          // const ListTile(
                          //   leading: CircleAvatar(
                          //     child: Icon(Icons.person),
                          //   ),
                          //   title: Text(
                          //       "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
                          // ),
                          // const Divider(
                          //   thickness: 1,
                          // ),
                          // const ListTile(
                          //   leading: CircleAvatar(),
                          //   title: Text(
                          //       "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
                          // ),
                          // const Divider(
                          //   thickness: 1,
                          // ),
                          // const ListTile(
                          //   leading: CircleAvatar(),
                          //   title: Text(
                          //       "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
                          // ),
                        ],
                      ),
                    ),
                    GridView.count(
                      crossAxisCount: 2,
                      //  shrinkWrap: true,
                      children: List.generate(10, (index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration:
                                BoxDecoration(color: Colors.blueGrey.shade50),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 10.0,
                                ),
                                const CircleAvatar(
                                  child: Icon(Icons.person),
                                ),
                                const SizedBox(
                                  height: 16.0,
                                ),
                                const Text("Pawan Kumar"),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text("₹"),
                                    Text("20/hr"),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      child: const Text("hire Me"),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                    SizedBox(
                      height: 300,
                      width: 400,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              launchMap(widget.title);
                            },
                            child: const Text(
                              'Get Direction',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailsPageCard extends StatelessWidget {
  final String? title;
  final String? noOfReviews;
  final double? rating;
  const DetailsPageCard({Key? key, this.rating, this.title, this.noOfReviews})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
          color: const Color(0xffE9F4F9),
          borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Booking",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff5A6C64),
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    "8.0/10",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff5A6C64)),
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          const Text(
            " Based on 30 reviews",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xff879D95)),
          ),
        ],
      ),
    );
  }
}

class RatingBar extends StatelessWidget {
  final int rating;
  const RatingBar(this.rating, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.star,
          color: rating.round() >= 1 ? Colors.white70 : Colors.white30,
        ),
        const SizedBox(
          width: 3,
        ),
        Icon(
          Icons.star,
          color: rating.round() >= 2 ? Colors.white70 : Colors.white30,
        ),
        const SizedBox(
          width: 3,
        ),
        Icon(
          Icons.star,
          color: rating.round() >= 3 ? Colors.white70 : Colors.white30,
        ),
        const SizedBox(
          width: 3,
        ),
        Icon(
          Icons.star,
          color: rating.round() >= 4 ? Colors.white70 : Colors.white30,
        ),
        const SizedBox(
          width: 3,
        ),
        Icon(
          Icons.star,
          color: rating.round() >= 5 ? Colors.white70 : Colors.white30,
        ),
      ],
    ));
  }
}

class ImageListTile extends StatelessWidget {
  final String imgUrl;
  const ImageListTile({Key? key, required this.imgUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: CachedNetworkImage(
          imageUrl: imgUrl,
          height: 220,
          width: 150,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ghumo/global/change_dham.dart';
import 'package:ghumo/global/global.dart';
import 'package:ghumo/home/drawer/drawer.dart';
import 'package:ghumo/home/hotels/near_hotel.dart';
import 'package:ghumo/home/places/caousel_places.dart';
import 'package:ghumo/home/places/near_place.dart';
import 'package:ghumo/home/restaurent/csrousel_restaurent.dart';
import 'package:ghumo/home/restaurent/near_restatutent.dart';

import 'hotels/carousel_hotels.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin, RestorationMixin {
  bool isSliding = false;
  List<String> item = [
    'Badrinath',
    'Dwarka',
    'Puri',
    'Rameswaram',
  ];
  String? selectedItem = sharedPreferences!.getString('dham') ?? 'Puri';
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  late TabController _tabController;

  final RestorableInt tabIndex = RestorableInt(0);

  @override
  String get restorationId => 'tab_non_scrollable_demo';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(tabIndex, 'tab_index');
    _tabController.index = tabIndex.value;
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: 0,
      length: 3,
      vsync: this,
    );
    _tabController.addListener(() {
      setState(() {
        tabIndex.value = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    tabIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tabs = [
      "Places",
      "Restaurants",
      "Hotels",
    ];
    return Scaffold(
      //floatingActionButtonAnimator: ,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: isSliding
          ? ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return const ChangeDham();
                    });
              },
              child: const Icon(Icons.menu),
              style: ButtonStyle(
                shape: MaterialStateProperty.all(const CircleBorder()),
                padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
                backgroundColor:
                    MaterialStateProperty.all(Colors.blue), // <-- Button color
                overlayColor:
                    MaterialStateProperty.resolveWith<Color?>((states) {
                  if (states.contains(MaterialState.pressed)) {
                    return Colors.deepPurple;
                  }
                  return null; // <-- Splash color
                }),
              ),
            )
          : null,
      key: _scaffoldKey,
      drawer: const Drawer(
        child: NavigationDrawerWidget(),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.blueGrey.shade50,
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              SizedBox(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.white),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.menu,
                          color: Colors.deepPurple,
                        ),
                        onPressed: () {
                          _scaffoldKey.currentState!.openDrawer();
                        },
                      ),
                      const Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: "Search places, restaurants",
                              border: InputBorder.none,
                              hintStyle: TextStyle(color: Colors.grey)),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.account_balance_wallet_rounded,
                          color: Colors.deepPurple,
                        ),
                        onPressed: () {
                          //TODOS: WALLET
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: TabBar(
                  controller: _tabController,
                  isScrollable: false,
                  // give the indicator a decoration (color and border radius)
                  indicator: BoxDecoration(
                      color: Colors.deepPurple.shade100,
                      border: Border.all(width: 2.0, color: Colors.deepPurple),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(99.0))),
                  labelColor: Colors.deepPurple,
                  unselectedLabelColor: Colors.black,
                  tabs: [for (final tab in tabs) Tab(text: tab)],
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    Column(
                      children: [
                        const PlacesTab(),
                        const SizedBox(
                          height: 20.0,
                        ),
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'More places to visit',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Expanded(
                          child: NotificationListener<UserScrollNotification>(
                            onNotification: ((notification) {
                              if (notification.direction ==
                                  ScrollDirection.forward) {
                                if (!isSliding) {
                                  setState(() {
                                    isSliding = true;
                                  });
                                }
                              } else if (notification.direction ==
                                  ScrollDirection.reverse) {
                                if (isSliding) {
                                  setState(() {
                                    isSliding = false;
                                  });
                                }
                              }
                              return isSliding;
                            }),
                            child: const NearPlace(),
                          ),
                        ),
                      ],
                    ),

                    //TODOS: RESTAURENT IMPLEMENTATION
                    Column(
                      children: [
                        const CarouselRestaurent(),
                        const SizedBox(
                          height: 20.0,
                        ),
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'More places to visit',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Expanded(
                          child: NotificationListener<UserScrollNotification>(
                            onNotification: ((notification) {
                              if (notification.direction ==
                                  ScrollDirection.forward) {
                                if (!isSliding) {
                                  setState(() {
                                    isSliding = true;
                                  });
                                }
                              } else if (notification.direction ==
                                  ScrollDirection.reverse) {
                                if (isSliding) {
                                  setState(() {
                                    isSliding = false;
                                  });
                                }
                              }
                              return isSliding;
                            }),
                            child: const NearRestaurentPlace(),
                          ),
                        ),
                      ],
                    ),

                    //TODOS: Hotel IMPLEMENTATION
                    // second tab bar view widget
                    Column(
                      children: [
                        const CarouselHotel(),
                        const SizedBox(
                          height: 20.0,
                        ),
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'More places to visit',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Expanded(
                          child: NotificationListener<UserScrollNotification>(
                            onNotification: ((notification) {
                              if (notification.direction ==
                                  ScrollDirection.forward) {
                                if (!isSliding) {
                                  setState(() {
                                    isSliding = true;
                                  });
                                }
                              } else if (notification.direction ==
                                  ScrollDirection.reverse) {
                                if (isSliding) {
                                  setState(() {
                                    isSliding = false;
                                  });
                                }
                              }
                              return isSliding;
                            }),
                            child: const NearHotel(),
                          ),
                        ),
                      ],
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

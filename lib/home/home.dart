import 'package:flutter/material.dart';
import 'package:ghumo/home/drawer/drawer.dart';
import 'package:ghumo/home/places/caousel_places.dart';
import 'package:ghumo/home/places/near_place.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin, RestorationMixin {
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
                      children: const <Widget>[
                        PlacesTab(),
                        SizedBox(
                          height: 20.0,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'More places to visit',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Expanded(
                          child: NearPlace(),
                        ),
                      ],
                    ),
                    const Center(
                      child: Text(
                        'Restaurants',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    // second tab bar view widget
                    const Center(
                      child: Text(
                        'Hotels',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
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

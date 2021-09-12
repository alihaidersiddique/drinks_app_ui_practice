import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui_pratice_1/models/products.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  bool _btnDrinkChange = false;
  bool _btnFoodChange = false;

  TabController? tabControllerSubMenus, tabControllerMenus;

  @override
  void initState() {
    tabControllerSubMenus = TabController(length: 5, vsync: this);
    tabControllerMenus = TabController(length: 2, vsync: this);
    super.initState();
    localData();
  }

  localData() async {
    final mobilesJson =
        await rootBundle.loadString("assets/files/products.json");
    final decodedJson = jsonDecode(mobilesJson);
    var valuableData = decodedJson["tea"];
    Drinks.data = List.from(valuableData)
        .map<Drinks>((drinks) => Drinks.fromMap(drinks))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF8F7F3),
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: Column(
          children: [
            SizedBox(height: 15.0),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'EMBA',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'What Would\nYou Like?',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            Container(
                padding: const EdgeInsets.only(bottom: 40.0),
                width: MediaQuery.of(context).size.width,
                child: TextFormField(
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.search,
                        size: 35.0,
                        color: Colors.grey,
                      ),
                      hintText: 'Search...',
                      hintStyle: TextStyle(color: Colors.black)),
                )),
            TabBar(
              controller: tabControllerMenus,
              indicatorColor: Colors.transparent,
              overlayColor: MaterialStateProperty.all(Colors.transparent),
              unselectedLabelColor: Colors.grey.withOpacity(0.5),
              tabs: [
                Tab(
                  child: SizedBox(
                    width: 150,
                    height: 60,
                    child: ElevatedButton.icon(
                        onPressed: () => {
                              tabControllerMenus!.animateTo(0),
                              setState(() {
                                _btnFoodChange = false;
                              })
                            },
                        icon: Icon(
                          Icons.local_drink,
                          size: 24.0,
                          color: _btnFoodChange ? Colors.black : Colors.white,
                        ),
                        label: Text(
                          'Drinks',
                          style: TextStyle(
                              color:
                                  _btnFoodChange ? Colors.black : Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                            elevation: 0.0,
                            onPrimary: Colors.transparent,
                            primary: _btnFoodChange
                                ? Color(0xffF8F7F3)
                                : Colors.black,
                            side: BorderSide(width: 1, color: Colors.black))),
                  ),
                ),
                Tab(
                  child: SizedBox(
                    width: 150,
                    height: 60,
                    child: ElevatedButton.icon(
                        clipBehavior: Clip.antiAlias,
                        onPressed: () => {
                              tabControllerMenus!.animateTo(1),
                              setState(() {
                                _btnFoodChange = true;
                              })
                            },
                        icon: Icon(
                          Icons.food_bank,
                          size: 24.0,
                          color: _btnFoodChange ? Colors.white : Colors.black,
                        ),
                        label: Text(
                          'Food',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color:
                                  _btnFoodChange ? Colors.white : Colors.black),
                        ),
                        style: ElevatedButton.styleFrom(
                            onPrimary: Colors.transparent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                            elevation: 0,
                            primary: _btnFoodChange
                                ? Colors.black
                                : Color(0xffF8F7F3),
                            side: BorderSide(width: 1.0, color: Colors.black))),
                  ),
                )
              ],
            ),
            SizedBox(height: 20.0),
            Expanded(
              child: TabBarView(
                controller: tabControllerMenus,
                children: [
                  // First Menu Screen
                  Column(children: [
                    Column(
                      children: [
                        // Sub Menus Tab Bar
                        TabBar(
                            controller: tabControllerSubMenus,
                            labelColor: Colors.black,
                            overlayColor:
                                MaterialStateProperty.all(Colors.transparent),
                            unselectedLabelColor: Colors.grey.withOpacity(0.5),
                            isScrollable: true,
                            indicatorColor: Colors.transparent,
                            tabs: [
                              Tab(
                                child: Text(
                                  'Tea',
                                  style: TextStyle(
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  'Lassi',
                                  style: TextStyle(
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  'Milk Shakes',
                                  style: TextStyle(
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  'Soft Drinks',
                                  style: TextStyle(
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  'Protein Shakes',
                                  style: TextStyle(
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ]),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                          controller: tabControllerSubMenus,
                          children: [
                            StaggeredGridView.countBuilder(
                                shrinkWrap: true,
                                crossAxisCount: 2,
                                itemCount: Drinks.data.length,
                                mainAxisSpacing: 32.0,
                                crossAxisSpacing: 32.0,
                                itemBuilder: (context, index) {
                                  final item = Drinks.data[index];
                                  return InkWell(
                                      child: GestureDetector(
                                          onTap: () {},
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(25.0),
                                              color: Colors.white,
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 25, right: 25, top: 10),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 16.0),
                                                    child: Center(
                                                      child: Image.network(
                                                        item.image,
                                                        height: 120,
                                                        width: 120,
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                      '\$${item.price.toString()}',
                                                      style: TextStyle(
                                                          fontSize: 18.0,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  Text(item.name,
                                                      style: TextStyle(
                                                          fontSize: 15.0,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  Text(item.quantity,
                                                      style: TextStyle(
                                                          fontSize: 12.0,
                                                          color: Colors.grey)),
                                                  SizedBox(
                                                    height: 5.0,
                                                  )
                                                ],
                                              ),
                                            ),
                                          )));
                                },
                                staggeredTileBuilder: (index) =>
                                    StaggeredTile.count(
                                        1, index.isEven ? 1.4 : 1.5)),
                            Container(
                              padding: EdgeInsets.only(top: 150.0),
                              child: Text(
                                'Lassi',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 150.0),
                              child: Text(
                                'Milk Shakes',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 150.0),
                              child: Text(
                                'Soft Drinks',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 150.0),
                              child: Text(
                                'Protein Shakes',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ]),
                    )
                  ]),
                  // Second Menu Screen
                  Container(
                    padding: EdgeInsets.only(top: 150.0),
                    child: Text(
                      'Food\'s List',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
      floatingActionButton: Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            border: Border.all(width: 3, color: Colors.white),
            borderRadius: BorderRadius.circular(100),
          ),
          child: FloatingActionButton(
            backgroundColor: Color(0xffF5E1BC),
            elevation: 0,
            onPressed: () {},
            child: Icon(
              Icons.shop,
              color: Colors.black,
              size: 30,
            ),
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 7,
        child: Container(
          height: 60.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Left tab bar icons
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                      onPressed: () {},
                      minWidth: 40.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.car_rental,
                            color: Colors.grey,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              'Order',
                              style: TextStyle(
                                  color: Colors.grey.shade400, fontSize: 12.0),
                            ),
                          )
                        ],
                      )),
                  MaterialButton(
                      onPressed: () {},
                      minWidth: 40.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.games,
                            color: Colors.grey,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              'Clubhouse',
                              style: TextStyle(
                                  color: Colors.grey.shade400, fontSize: 12.0),
                            ),
                          )
                        ],
                      )),
                ],
              ),
              // Right tab bar icons
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                      onPressed: () {},
                      minWidth: 40.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.book_online,
                            color: Colors.grey,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              'Reservation',
                              style: TextStyle(
                                  color: Colors.grey.shade400, fontSize: 12.0),
                            ),
                          )
                        ],
                      )),
                  MaterialButton(
                      onPressed: () {},
                      minWidth: 40.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.timelapse,
                            color: Colors.grey,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              'Recent',
                              style: TextStyle(
                                  color: Colors.grey.shade400, fontSize: 12.0),
                            ),
                          )
                        ],
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

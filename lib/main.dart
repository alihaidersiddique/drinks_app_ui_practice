import 'package:flutter/material.dart';
import 'package:ui_pratice_1/pages/my_app.dart';

void main() => runApp(MyApp());

// Widget Aesai{

//   return ListView(
//             children: [
//               Container(
//                 width: MediaQuery.of(context).size.width,
//                 child: TabBar(
//                   controller: tabControllerMenus,
//                   labelColor: Colors.black,
//                   overlayColor: MaterialStateProperty.all(Colors.transparent),
//                   unselectedLabelColor: Colors.grey.withOpacity(0.5),
//                   isScrollable: true,
//                   indicatorColor: Colors.transparent,
//                   tabs: [
//                     Tab(
//                       child: SizedBox(
//                         width: 120,
//                         height: 40,
//                         child: ElevatedButton.icon(
//                             onPressed: () => {
//                                   setState(() {
//                                     _btnDrinkChange = true;
//                                   })
//                                 },
//                             icon: Icon(
//                               Icons.local_drink,
//                               size: 24.0,
//                               color:
//                                   _btnDrinkChange ? Colors.white : Colors.black,
//                             ),
//                             label: Text(
//                               'Drinks',
//                               style: TextStyle(
//                                   color: _btnDrinkChange
//                                       ? Colors.white
//                                       : Colors.black),
//                             ),
//                             style: ElevatedButton.styleFrom(
//                                 shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(20)),
//                                 elevation: 0.0,
//                                 onPrimary: Colors.transparent,
//                                 primary: _btnDrinkChange
//                                     ? Colors.black
//                                     : Color(0xffF8F7F3),
//                                 side:
//                                     BorderSide(width: 1, color: Colors.black))),
//                       ),
//                     ),
//                     Tab(
//                       child: SizedBox(
//                         width: 120,
//                         height: 40,
//                         child: ElevatedButton.icon(
//                             clipBehavior: Clip.antiAlias,
//                             onPressed: () => {
//                                   setState(() {
//                                     _btnFoodChange = true;
//                                   })
//                                 },
//                             icon: Icon(
//                               Icons.food_bank,
//                               size: 24.0,
//                               color:
//                                   _btnFoodChange ? Colors.white : Colors.black,
//                             ),
//                             label: Text(
//                               'Food',
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   color: _btnFoodChange
//                                       ? Colors.white
//                                       : Colors.black),
//                             ),
//                             style: ElevatedButton.styleFrom(
//                                 onPrimary: Colors.transparent,
//                                 shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(20)),
//                                 elevation: 0,
//                                 primary: _btnFoodChange
//                                     ? Colors.black
//                                     : Color(0xffF8F7F3),
//                                 side: BorderSide(
//                                     width: 1.0, color: Colors.black))),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               ConstrainedBox(
//                 constraints: BoxConstraints.tightFor(
//                     width: MediaQuery.of(context).size.width,
//                     height: MediaQuery.of(context).size.height),
//                 child: TabBarView(controller: tabControllerMenus, children: [
//                   Column(
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.only(top: 25.0),
//                         child: TabBar(
//                           controller: tabController,
//                           labelColor: Colors.black,
//                           overlayColor:
//                               MaterialStateProperty.all(Colors.transparent),
//                           unselectedLabelColor: Colors.grey.withOpacity(0.5),
//                           isScrollable: true,
//                           indicatorColor: Colors.transparent,
//                           tabs: [
//                             Tab(
//                               child: Text(
//                                 'All',
//                                 style: TextStyle(
//                                     fontSize: 17.0,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                             Tab(
//                               child: Text(
//                                 'Tea',
//                                 style: TextStyle(
//                                     fontSize: 17.0,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                             Tab(
//                               child: Text(
//                                 'Lassi',
//                                 style: TextStyle(
//                                     fontSize: 17.0,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                             Tab(
//                               child: Text(
//                                 'Milk Shakes',
//                                 style: TextStyle(
//                                     fontSize: 17.0,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                             Tab(
//                               child: Text(
//                                 'Cold Drinks',
//                                 style: TextStyle(
//                                     fontSize: 17.0,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       ConstrainedBox(
//                           constraints: BoxConstraints.tightFor(
//                               height: MediaQuery.of(context).size.height,
//                               width: MediaQuery.of(context).size.width),
//                           child: StaggeredGridView.countBuilder(
//                               shrinkWrap: true,
//                               crossAxisCount: 2,
//                               itemCount: Drinks.data.length,
//                               mainAxisSpacing: 32.0,
//                               crossAxisSpacing: 32.0,
//                               itemBuilder: (context, index) {
//                                 final item = Drinks.data[index];
//                                 return InkWell(
//                                     child: GestureDetector(
//                                         onTap: () {},
//                                         child: Container(
//                                           decoration: BoxDecoration(
//                                             borderRadius:
//                                                 BorderRadius.circular(25.0),
//                                             color: Colors.white,
//                                           ),
//                                           child: Padding(
//                                             padding: const EdgeInsets.only(
//                                                 left: 25, right: 25, top: 10),
//                                             child: Column(
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.start,
//                                               children: [
//                                                 Center(
//                                                   child: Image.network(
//                                                     item.image,
//                                                     height: 240,
//                                                     width: 200,
//                                                   ),
//                                                 ),
//                                                 Text(
//                                                     '\$${item.price.toString()}',
//                                                     style: TextStyle(
//                                                         fontSize: 18.0,
//                                                         fontWeight:
//                                                             FontWeight.bold)),
//                                                 Text(item.name,
//                                                     style: TextStyle(
//                                                         fontSize: 15.0,
//                                                         fontWeight:
//                                                             FontWeight.bold)),
//                                                 Text(item.quantity,
//                                                     style: TextStyle(
//                                                         fontSize: 16.0,
//                                                         color: Colors.grey)),
//                                               ],
//                                             ),
//                                           ),
//                                         )));
//                               },
//                               staggeredTileBuilder: (index) =>
//                                   StaggeredTile.count(
//                                       1, index.isEven ? 2.2 : 2.0))),
//                     ],
//                   ),
//                   Column(children: [Text('Wait for it')])
//                 ]),
//               )
//             ],
//           ),
// }


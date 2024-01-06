// ignore_for_file: prefer_const_constructors, dead_code, unnecessary_string_interpolations, prefer_const_literals_to_create_immutables

import 'package:clay_containers/constants.dart';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/views/imagePlace.dart';
import 'package:flutter_application/views/priceList.dart';

class WeddingView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return WeddingViewState();
  }
}

class WeddingViewState extends State<WeddingView> {
  int maxLinesToShow = 3;
  Icon icon = Icon(
    Icons.thumb_up,
    color: Color(0xFF5BA581),
    size: 20,
  );
  String numLine = "المزيد";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
                child: Column(
                  
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50),
                Stack(
                  children: [
                    Positioned(
                      // Adjust this value to move it down
                      child: ClayContainer(
                        color: Color.fromARGB(255, 213, 212, 212),
                        height: 200,
                        width: 400,
                        depth: 20,
                        curveType: CurveType.convex,
                        spread: 0,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(7),
                      child: ClayContainer(
                        //   color: Color.fromARGB(255, 213, 212, 212),
                        // height: 185,
                        // width: 330,
                        // depth: -20,
                        // spread: 0,
                        child: Image.asset('images/garden1.png'),
                        // child: Container(
                        //   color: Colors.white,
                        //   height: 200,
                        //   width: 350,

                        // ),
                      ),
                    ),
                    IconButton(
                      padding: const EdgeInsets.only(left: 20, top: 10),
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_back_ios,
                        size: 25,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),

                Row(children: [
                  Text(
                    "شركة شهد ايفينت",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      // color: Color(0xFF5BA581)
                    ),
                  ),
                  SizedBox(
                    width: 100,
                  ),
                  IconButton(
                    onPressed: () {
                      print("1");
                    },
                    icon: Icon(
                      Icons.favorite_outline_rounded,
                      size: 25,
                      color: Colors.red,
                    ),
                  ),


                    IconButton(
                    onPressed: () {
                      print("1");
                    },
                    icon: Icon(
                      Icons.email,
                      size: 25,
                      color: Colors.blueGrey,
                    ),
                  ),







                ]),
                Row(children: [
                  Container(
                      child: Icon(
                    Icons.place,
                    color: Colors.grey,
                  )),
                  Container(
                      padding: EdgeInsets.only(right: 20),
                      child: Text(
                        "نابلس - شارع سفيان",
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                      )),
                  for (int i = 0; i < 3; i++)
                    Container(
                        child: Icon(
                      Icons.star,
                      color: Colors.yellow,
                    )),
                  //where rating is 3 and total num of star is 5
                  for (int i = 0; i < 5 - 3; i++)
                    Container(
                        child: Icon(
                      Icons.star_border,
                      color: Colors.yellow,
                    )),
                  SizedBox(
                    width: 20,
                  ),
                  // Text(
                  //   // "${68} Reviews",
                  //   // style: TextStyle(fontSize: 15, color: Colors.grey),
                  // ),
                ]),
                SizedBox(
                  height: 5,
                ),
                Divider(
                  color: Colors.grey,
                  height: 20,
                  thickness: 1,
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                    margin: EdgeInsets.only(right: 20),
                    child: Text(
                      "محتوى العرض ",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        // color: Color(0xFF5BA581)
                      ),
                    )),
                SizedBox(
                  height: 10,
                ),
                Text(
                  ' بشمل العرض عرس فاخر في افخم القاعات قاعة الجاردنز مع توفير جميع الخدمات التي تحتاجها في يوم العمر بسعر مغري جدا يمكنك معرفة التفاصيل اسفل الصفحة  سارع بالحجز معنا',
                  maxLines: maxLinesToShow,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 14,
                      color: Color.fromARGB(255, 134, 133, 133),
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                // TextButton(
                //     onPressed: () {
                //       setState(() {
                //         if (maxLinesToShow == 2) {
                //           maxLinesToShow = 4;
                //           icon = Icon(
                //             Icons.thumb_down,
                //             color: Color(0xFF5BA581),
                //             size: 20,
                //           );
                //           numLine = "Less";
                //         } else {
                //           maxLinesToShow = 2;
                //           icon = Icon(
                //             Icons.thumb_up,
                //             color: Color(0xFF5BA581),
                //             size: 20,
                //           );
                //           numLine = "More";
                //         }
                //       });
                //     },
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: [
                //         Container(
                //           child: icon,
                //         ),
                //         SizedBox(
                //           width: 10,
                //         ),
                //         Text(
                //           "${numLine}",
                //           style:
                //               TextStyle(fontSize: 16, color: Colors.grey),
                //         )
                //       ],
                //     )),
                Divider(
                  color: Colors.grey,
                  height: 20,
                  thickness: 1,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    margin: EdgeInsets.only(right: 40),
                    child: Text(
                      " أشهر الأعراس بالمكان",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        // color: Color(0xFF5BA581)
                      ),
                    )),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 140,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisSpacing: 0,
                      crossAxisSpacing: 0,
                    ),
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, i) {
                      // List of images
                      List<String> images = [
                        'images/garden2.png',
                        'images/garden1.png', // Replace this with the path to your second image
                        'images/roz.png',
                        // Replace this with the path to your third image
                      ];
                      

                        List<String> texts = [
        "أحمد ونور",
        "محمد وأمل",
        "علي وماسة",
      ];
            String imageText = texts[i];

                      // Access the images based on the index i
                      String imagePath = images[i];

                      return Stack(
                        children: [
                          ClayContainer(
                            color: Colors.white,
                            height: 140,
                            width: 130,
                            depth: 40,
                            curveType: CurveType.convex,
                            spread: 2,
                            child: Container(
                              margin: EdgeInsets.only(top: 90, left: 10),
                              child: Text(imageText ,      textAlign: TextAlign.center,
                                                                                           ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(7),
                            child: ClayContainer(
                              color: Colors.white,
                              height: 75,
                              width: 115,
                              depth: -40,
                              spread: 4,
                              child: Image.asset(imagePath),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(children: [
                  Container(
                      width: 120,
                      margin: EdgeInsets.only(left: 50),
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                          border: Border.all(
                            color: Color(0xFF5BA581),
                            width: 2.0,
                            style: BorderStyle.solid,
                          )),
                      child: TextButton(
                        onPressed: () {
                 Navigator.push(
                      context,
                    MaterialPageRoute(builder: (context) => YourPage()),
                             );
                               },
                          child: Text(
                            "قائمة الأسعار",
                            style: TextStyle(
                                fontSize: 16,
                                color: Color(0xFF5BA581),
                                fontWeight: FontWeight.bold),
                          ))),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                      width: 130,
                      //  margin: EdgeInsets.only(left: 2),
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                          border: Border.all(
                            color: Color(0xFF5BA581),
                            width: 2.0,
                            style: BorderStyle.solid,
                          )),
                      child: TextButton(
                          onPressed: () {
                 Navigator.push(
                      context,
                    MaterialPageRoute(builder: (context) => brandView()),
                             );
                               },
                          child: Text(
                            "حديقة التصوير",
                            style: TextStyle(
                                fontSize: 16, color: Color(0xFF5BA581), fontWeight: FontWeight.bold),
                          ))),
                ]),
                Divider(
                  color: Colors.grey,
                  height: 20,
                  thickness: 1,
                ),
                SizedBox(
                  height: 10,
                ),
                // Container(
                //     margin: EdgeInsets.only(right: 250),
                //     child: Text(
                //       "Reviews",
                //       style: TextStyle(
                //         fontSize: 20,
                //         fontWeight: FontWeight.bold,
                //         // color: Color(0xFF5BA581)
                //       ),
                //     )),
                SizedBox(
                  height: 5,
                ),
                // Container(
                //     // padding: EdgeInsets.only(top: 50),
                //     height: 180,
                //     child: ListView.builder(
                //         scrollDirection: Axis.vertical,
                //         itemCount: 3,
                //         itemBuilder: (context, i) {
                //           return Container(
                //               margin: EdgeInsets.only(bottom: 10),
                //               height: 90,
                //               child: Stack(children: [
                //                 CircleAvatar(
                //                   backgroundColor: Colors.grey,
                //                   // backgroundImage: AssetImage(""),
                //                 ),
                //                 Container(
                //                     margin: EdgeInsets.only(right: 120),
                //                     child: Column(
                //                         mainAxisAlignment:
                //                             MainAxisAlignment.start,
                //                         children: [
                //                           Text("${"Zoya Patel"}",
                //                               style: TextStyle(
                //                                 fontSize: 16,
                //                                 fontWeight: FontWeight.bold,
                //                               )),
                //                           Container(
                //                               margin: EdgeInsets.only(left: 65),
                //                               child: Row(children: [
                //                                 for (int i = 0; i < 3; i++)
                //                                   Container(
                //                                       child: Icon(
                //                                     Icons.star,
                //                                     size: 18,
                //                                     color: Colors.yellow,
                //                                   )),
                //                                 //where rating is 3 and total num of star is 5
                //                                 for (int i = 0; i < 5 - 3; i++)
                //                                   Container(
                //                                     child: Icon(
                //                                       Icons.star_border,
                //                                       size: 18,
                //                                       color: Colors.yellow,
                //                                     ),
                //                                   )
                //                               ])),
                //                           Text("lkdjfielwkft",
                //                               style: TextStyle(
                //                                   fontSize: 13,
                //                                   color: Colors.grey))
                //                         ])),
                //               ]));
                //         })),
                // Divider(
                //   color: Colors.grey,
                //   height: 20,
                //   thickness: 1,
                // ),
                Center(
              child:  Container(
                    width: 200,

                    //  margin: EdgeInsets.only(left: 2),
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Color(0xFF5BA581),
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                    child: TextButton(
                        onPressed: () {
                          setState(() {});
                        },
                        child: Text(
                          "احجز العرض",
                          style: TextStyle(fontSize: 18, color: Colors.white ,fontWeight: FontWeight.bold),
                  )  ))),
              ],

              //... Rest of your code with Arabic text
            )),
          ),
        ),
      ),
    );
  }
}

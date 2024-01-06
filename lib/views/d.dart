// ignore_for_file: prefer_const_constructors, dead_code, unnecessary_string_interpolations, prefer_const_literals_to_create_immutables

import 'package:clay_containers/constants.dart';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WeddingView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return WeddingViewState();
  }
}

class WeddingViewState extends State<WeddingView> {
  int maxLinesToShow = 2;
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
                  Stack(
                    children: [
                      ClayContainer(
                        color: Color.fromARGB(255, 213, 212, 212),
                        height: 200,
                        width: 400,
                        depth: 20,
                        curveType: CurveType.convex,
                        spread: 0,
                      ),
                      Padding(
                        padding: EdgeInsets.all(7),
                        child: ClayContainer(
                          color: Color.fromARGB(255, 213, 212, 212),
                          height: 185,
                          width: 330,
                          depth: -20,
                          spread: 0,
                          child: Container(
                            color: Colors.white,
                            height: 200,
                            width: 350,
                            child: Text("\n \n \n \n \n \t ضع الصورة هنا"),
                          ),
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
                          "Presidy Sports Club",
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
                        )
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
                              "Sherkh",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.grey),
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
                        Text(
                          "${68} Reviews",
                          style: TextStyle(fontSize: 15, color: Colors.grey),
                        ),
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
                          margin: EdgeInsets.only(right: 270),
                          child: Text(
                            "About",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              // color: Color(0xFF5BA581)
                            ),
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                        maxLines: maxLinesToShow,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 13, color: Colors.grey),
                      ),
                      SizedBox(height: 16),
                      TextButton(
                          onPressed: () {
                            setState(() {
                              if (maxLinesToShow == 2) {
                                maxLinesToShow = 4;
                                icon = Icon(
                                  Icons.thumb_down,
                                  color: Color(0xFF5BA581),
                                  size: 20,
                                );
                                numLine = "Less";
                              } else {
                                maxLinesToShow = 2;
                                icon = Icon(
                                  Icons.thumb_up,
                                  color: Color(0xFF5BA581),
                                  size: 20,
                                );
                                numLine = "More";
                              }
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                child: icon,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "${numLine}",
                                style:
                                    TextStyle(fontSize: 16, color: Colors.grey),
                              )
                            ],
                          )),
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
                            "Famous Wedding at this Venue",
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
                          // padding: EdgeInsets.only(top: 50),
                          height: 160,
                          child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 1,
                                mainAxisSpacing: 0,
                                crossAxisSpacing: 0,
                              ),
                              scrollDirection: Axis.horizontal,
                              itemCount: 3,
                              itemBuilder: (context, i) {
                                return Stack(children: [
                                  ClayContainer(
                                    color: Colors.white,
                                    height: 140,
                                    width: 130,
                                    depth: 40,
                                    curveType: CurveType.convex,
                                    spread: 2,
                                    child: Container(
                                      margin:
                                          EdgeInsets.only(top: 90, left: 10),
                                      child: Text("Text"),
                                    ),
                                  ),
                                  Padding(
                                      padding: EdgeInsets.all(7),
                                      child: ClayContainer(
                                          color: Colors.white,
                                          height: 75,
                                          width: 115,
                                          depth: -40,
                                          spread: 2,
                                          child: Text("    Image")))
                                ]);
                              })),
                      SizedBox(
                        height: 10,
                      ),
                      Row(children: [
                        Container(
                            width: 100,
                            margin: EdgeInsets.only(left: 50),
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25)),
                                border: Border.all(
                                  color: Color(0xFF5BA581),
                                  width: 2.0,
                                  style: BorderStyle.solid,
                                )),
                            child: TextButton(
                                onPressed: () {
                                  setState(() {});
                                },
                                child: Text(
                                  "PriceList",
                                  style: TextStyle(
                                      fontSize: 16, color: Color(0xFF5BA581)),
                                ))),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                            width: 100,
                            //  margin: EdgeInsets.only(left: 2),
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25)),
                                border: Border.all(
                                  color: Color(0xFF5BA581),
                                  width: 2.0,
                                  style: BorderStyle.solid,
                                )),
                            child: TextButton(
                                onPressed: () {
                                  setState(() {});
                                },
                                child: Text(
                                  "Images",
                                  style: TextStyle(
                                      fontSize: 16, color: Color(0xFF5BA581)),
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
                      Container(
                          margin: EdgeInsets.only(right: 250),
                          child: Text(
                            "Reviews",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              // color: Color(0xFF5BA581)
                            ),
                          )),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                          // padding: EdgeInsets.only(top: 50),
                          height: 180,
                          child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: 3,
                              itemBuilder: (context, i) {
                                return Container(
                                    margin: EdgeInsets.only(bottom: 10),
                                    height: 90,
                                    child: Stack(children: [
                                      CircleAvatar(
                                        backgroundColor: Colors.grey,
                                        // backgroundImage: AssetImage(""),
                                      ),
                                      Container(
                                          margin: EdgeInsets.only(right: 120),
                                          child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text("${"Zoya Patel"}",
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    )),
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        left: 65),
                                                    child: Row(children: [
                                                      for (int i = 0;
                                                          i < 3;
                                                          i++)
                                                        Container(
                                                            child: Icon(
                                                          Icons.star,
                                                          size: 18,
                                                          color: Colors.yellow,
                                                        )),
                                                      //where rating is 3 and total num of star is 5
                                                      for (int i = 0;
                                                          i < 5 - 3;
                                                          i++)
                                                      Container(
  child: Icon(
    Icons.star_border,
    size: 18,
    color: Colors.yellow,
  ),
)

                                                    ])),
                                                Text("lkdjfielwkft",
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        color: Colors.grey))
                                              ])),
                                    ]));
                              })),
                      Divider(
                        color: Colors.grey,
                        height: 20,
                        thickness: 1,
                      ),
                      Container(
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
                                "Book Venue",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ))),
                    ],

                  //... Rest of your code with Arabic text
                
              ),
            ),
          ),
        ),
      ),
    );
  }
}

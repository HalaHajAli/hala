// ignore_for_file: prefer_const_constructors, dead_code, unnecessary_string_interpolations, prefer_const_literals_to_create_immutables

import 'package:clay_containers/constants.dart';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class brandView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return brandViewTest();
  }
}

class brandViewTest extends State<brandView> {
  List<List> banderImages = [
    ["images/g1.png", ""],
    ["images/g2.png", ""],
    ["images/g33.png", ""],
    ["images/g4.png", ""],
    ["images/g44.png", ""],
    ["images/g5.png", ""],
    ["images/brandSeven.jpg", ""],
    //["images/brandEight.jpg", ""],
  //  ["images/brandNine.jpg", ""]
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Colors.white,
            padding: EdgeInsets.all(5),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: banderImages.length,
                itemBuilder: (context, i) {
                  return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        if ((i + 1) % 3 == 0)
                          InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Container(
                                          margin: EdgeInsets.only(left: 60),
                                          child: Text(
                                            "${banderImages[i][1]}",
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )),
                                      content: Image.asset(
                                        "${banderImages[i][0]}",
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context)
                                                .pop(); // Close the dialog
                                          },
                                          child: Text(
                                            'موافق',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: Stack(
                                children: [
                                  ClayContainer(
                                    color: Color.fromARGB(255, 213, 212, 212),
                                    height: 210,
                                    width: 290,
                                    depth: 20,
                                    curveType: CurveType.convex,
                                    spread: 0,
                                  ),
                                  Padding(
                                      padding: EdgeInsets.all(7),
                                      child: ClayContainer(
                                          color: Color.fromARGB(
                                              255, 213, 212, 212),
                                          height: 195,
                                          width: 275,
                                          depth: -10,
                                          spread: 0,
                                          child: Container(
                                              color: Colors.white,
                                              height: 180,
                                              width: 350,
                                              child: Column(children: [
                                                Container(
                                                    color: Colors.white,
                                                    padding: EdgeInsets.all(5),
                                                    margin: EdgeInsets.only(
                                                        left: 20),
                                                    child: Text(
                                                      "${banderImages[i][1]}",
                                                      style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    )),
                                                Container(
                                                    //  padding: EdgeInsets.all(10),
                                                    color: Colors.white,
                                                    height: 150,
                                                    width: 350,
                                                    child: Image.asset(
                                                      "${banderImages[i][0]}",
                                                    )),
                                              ])))),
                                ],
                              )),
                        if ((i + 1) % 3 > 0 && i % 2 != 0)
                          Container(
                              width: MediaQuery.of(context).size.width,
                              height: 150,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 2,
                                  itemBuilder: (context, index) {
                                    return Stack(
                                      children: [
                                        if (index == 0)
                                          InkWell(
                                              onTap: () {
                                                showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      title: Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 60),
                                                          child: Text(
                                                            "${banderImages[i][1]}",
                                                            style: TextStyle(
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          )),
                                                      content: Image.asset(
                                                        "${banderImages[i][0]}",
                                                      ),
                                                      actions: <Widget>[
                                                        TextButton(
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop(); // Close the dialog
                                                          },
                                                          child: Text(
                                                            'موافق',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                              },
                                              child: Container(
                                                  margin: EdgeInsets.only(
                                                      right: 10,
                                                      bottom: 5,
                                                      top: 5),
                                                  child: ClayContainer(
                                                      color: Color.fromARGB(
                                                          255, 213, 212, 212),
                                                      height: 150,
                                                      width: 165,
                                                      depth: 20,
                                                      curveType:
                                                          CurveType.convex,
                                                      spread: 0,
                                                      child: Padding(
                                                          padding:
                                                              EdgeInsets.all(7),
                                                          child: ClayContainer(
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      213,
                                                                      212,
                                                                      212),
                                                              height: 100,
                                                              width: 115,
                                                              depth: -20,
                                                              spread: 0,
                                                              child: Container(
                                                                  color: Colors
                                                                      .white,
                                                                  height: 200,
                                                                  width: 350,
                                                                  child: Column(
                                                                      children: [
                                                                        Container(
                                                                            margin:
                                                                                EdgeInsets.only(top: 0),
                                                                            color: Colors.white,
                                                                            child: Text(
                                                                              "${banderImages[i][1]}",
                                                                              style: TextStyle(
                                                                                fontSize: 15,
                                                                                fontWeight: FontWeight.bold,
                                                                              ),
                                                                            )),
                                                                        Container(
                                                                            margin:
                                                                                EdgeInsets.only(top: 0),
                                                                            child: Image.asset(
                                                                              "${banderImages[i][0]}",
                                                                              width: 120,
                                                                            ))
                                                                      ]))))))),
                                        if (index == 1)
                                          InkWell(
                                              onTap: () {
                                                showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      title: Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 60),
                                                          child: Text(
                                                            "${banderImages[i - 1][1]}",
                                                            style: TextStyle(
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          )),
                                                      content: Image.asset(
                                                        "${banderImages[i - 1][0]}",
                                                      ),
                                                      actions: <Widget>[
                                                        TextButton(
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop(); // Close the dialog
                                                          },
                                                          child: Text(
                                                            'موافق',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                              },
                                              child: Container(
                                                  margin: EdgeInsets.only(
                                                      right: 10,
                                                      bottom: 5,
                                                      top: 5),
                                                  child: ClayContainer(
                                                      color: Color.fromARGB(
                                                          255, 213, 212, 212),
                                                      height: 150,
                                                      width: 165,
                                                      depth: 40,
                                                      curveType:
                                                          CurveType.convex,
                                                      spread: 0,
                                                      child: Padding(
                                                          padding:
                                                              EdgeInsets.all(7),
                                                          child: ClayContainer(
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      213,
                                                                      212,
                                                                      212),
                                                              height: 120,
                                                              width: 115,
                                                              depth: -20,
                                                              spread: 0,
                                                              child: Container(
                                                                  color: Colors
                                                                      .white,
                                                                  height: 200,
                                                                  width: 350,
                                                                  child: Column(
                                                                      children: [
                                                                        Container(
                                                                            margin:
                                                                                EdgeInsets.only(top: 10),
                                                                            child: Image.asset(
                                                                              "${banderImages[i - 1][0]}",
                                                                              width: 120,
                                                                            )),
                                                                        Container(
                                                                            margin:
                                                                                EdgeInsets.only(top: 0),
                                                                            color: Colors.white,
                                                                            child: Text(
                                                                              "${banderImages[i - 1][1]}",
                                                                              style: TextStyle(
                                                                                fontSize: 15,
                                                                                fontWeight: FontWeight.bold,
                                                                              ),
                                                                            )),
                                                                      ]))))))),
                                      ],
                                    );
                                  })),
                        SizedBox(
                          height: 10,
                        ),
                      ]);
                })));
  }
}

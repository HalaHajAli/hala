// ignore_for_file: prefer_const_constructors, dead_code, unnecessary_string_interpolations, prefer_const_literals_to_create_immutables

import 'package:clay_containers/constants.dart';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class reservation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return reservationTest();
  }
}

class reservationTest extends State<reservation> {
  List<List> reservationPlace = [
    ["Hamsat Wedding ", "1000", "4-6 PM", "6-8 PM", "8-10 PM"],
    ["Golden Roof Weddings", "2000", "4-7 PM", "8-11 PM"],
    ["Al Saraya Hotel", "3000", "5-8 PM", "12-3 AM"],
  ];
  String selectedOption = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Color.fromARGB(255, 230, 249, 239),
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: reservationPlace.length,
                itemBuilder: (context, index) {
                  return Card(
                      child: Container(
                          height:
                              120 + (40 * (reservationPlace[index].length - 2)),
                          margin: EdgeInsets.only(top: 20),
                          padding: EdgeInsets.all(10),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(children: [
                                  Text(" ${reservationPlace[index][0]}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF5BA581),
                                        fontSize: 15,
                                      )),
                                  Spacer(),
                                  Row(children: [
                                    Text("Hall Price: ",
                                        style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 119, 119, 119),
                                          fontSize: 13,
                                        )),
                                    Text("${reservationPlace[index][1]}",
                                        style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 119, 119, 119),
                                          fontSize: 13,
                                        )),
                                    Text("\$",
                                        style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 119, 119, 119),
                                          fontSize: 13,
                                        )),
                                  ]),
                                ]),
                                Divider(thickness: 1),
                                for (int i = 2;
                                    i < reservationPlace[index].length;
                                    i++)
                                  Container(
                                      height: 40,
                                      child: RadioListTile<String>(
                                        activeColor:
                                            Color.fromARGB(255, 119, 119, 119),
                                        title: Text(
                                            "${reservationPlace[index][i]}",
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 115, 115, 115),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13,
                                            )),
                                        value: "${reservationPlace[index][i]}",
                                        groupValue: selectedOption,
                                        onChanged: (value) {
                                          setState(() {
                                            selectedOption = value!;
                                          });
                                        },
                                      )),
                                Divider(thickness: 1),
                                Container(
                                    margin: EdgeInsets.only(
                                      left: 100,
                                    ),
                                    child: MaterialButton(
                                        color: Color(0xFF5BA581),
                                        child: Text("Reservation",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13,
                                            )),
                                        onPressed: () {})),
                              ])));
                })));
  }
}

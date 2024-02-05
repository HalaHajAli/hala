import 'package:flutter/material.dart';
import 'package:flutter_application/views/offerProvider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application/views/book.dart';
import 'package:flutter_application/views/HallServicePage.dart';
import 'package:flutter_application/views/review.dart';
import 'package:flutter_application/views/guestlist.dart';
import 'package:flutter_application/views/gradProvider.dart';

class Reservation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ReservationTest();
  }
}

List<dynamic> packages =[];

class ReservationTest extends State<Reservation> {
  List<List> reservationPlace = [
    ["", "1000", "4-6 PM", "6-8 PM", "8-10 PM"],
    ["", "2000", "4-7 PM", "8-11 PM"],
    ["", "3000", "5-8 PM", "12-3 AM"],
  ];

  String selectedOption = "";
  String selectedHallName = "";
  String selectedTime = "";

  @override
  Widget build(BuildContext context) {
    locale:
    Locale('ar'); // Set the locale to Arabic

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF5BA581),
          title: Text(
            "وقت المناسبة",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          color: Color.fromARGB(255, 230, 249, 239),
          child: ListView.builder(
            itemCount: reservationPlace.length,
            itemBuilder: (context, index) {
              return Card(
                child: Container(
                  height: 120 + (40 * (reservationPlace[index].length - 2)),
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            " ${reservationPlace[index][0]}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF5BA581),
                              fontSize: 15,
                            ),
                          ),
                          Spacer(),
                          Row(
                            children: [
                              //       Text(
                              // //    "Hall Price: ",
                              //         style: TextStyle(
                              //           color: Color.fromARGB(255, 119, 119, 119),
                              //           fontSize: 13,
                              //         ),
                              //       ),
                              Text(
                                "${reservationPlace[index][1]}",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 119, 119, 119),
                                  fontSize: 13,
                                ),
                              ),
                              Text(
                                "\$",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 119, 119, 119),
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        height: 1,
                        color: Colors.grey,
                      ),
                      for (int i = 2; i < reservationPlace[index].length; i++)
                        Container(
                          height: 40,
                          child: RadioListTile<String>(
                            activeColor: Color.fromARGB(255, 119, 119, 119),
                            title: Text(
                              "${reservationPlace[index][i]}",
                              style: TextStyle(
                                color: Color.fromARGB(255, 115, 115, 115),
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                            value: "${reservationPlace[index][i]}",
                            groupValue: selectedOption,
                            onChanged: (value) {
                              setState(() {
                                selectedOption = value!;
                                selectedHallName = reservationPlace[index][0];
                                selectedTime = value;
                              });
                            },
                          ),
                        ),
                      Container(
                        height: 1,
                        color: Colors.grey,
                      ),
                      Center(
                        child: MaterialButton(
                          color: Color(0xFF5BA581),
                          child: Text(
                            "تأكيد الحجز",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                         onPressed: () {
  final offerProvider = Provider.of<OfferProvider>(context, listen: false);
  offerProvider.addToCart(selectedTime.toString());

  // Use Builder widget to get a new context inside the MaterialPageRoute
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (BuildContext context) {
        // Access the GradProvider using Provider.of in a new context
        final gradProvider = Provider.of<GradProvider>(context, listen: false);
        gradProvider.addToGradList(' الوقت:$selectedTime.toString()');

        // Return the widget you want to navigate to (GuestListPage in this case)
        return GuestListPage();
      },
    ),
  );
},

                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'package:flutter_application/views/offerProvider.dart';
import 'package:flutter_application/views/hallTime2.dart';
import 'package:flutter_application/views/ReqProvider.dart';

extension DateTimeExtension on DateTime {
  DateTime get date => DateTime(this.year, this.month, this.day);
}

class CupertinoDatePickerPage2 extends StatefulWidget {
  @override
  _CupertinoDatePickerPageState createState() =>
      _CupertinoDatePickerPageState();
}

class _CupertinoDatePickerPageState extends State<CupertinoDatePickerPage2> {
  DateTime _selectedDate = DateTime.now().add(Duration(days: 1)).date;
  bool timeSelected = false;
  int selectedTimeIndex = -1;
  Color buttonColor = Colors.grey;

  // Get the end date of the year
  DateTime endDate = DateTime(DateTime.now().year, 12, 31);

  @override
  Widget build(BuildContext context) {
    final reqProvider = Provider.of<ReqProvider>(context, listen: false);

    // Local variable to store the selected date
    DateTime selectedDateTemp = _selectedDate;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF5BA581),
        // decoration: BoxDecoration(
        //   gradient: LinearGradient(
        //     colors: [Colors.white, Color(0xFF5BA581)],
        //     begin: Alignment.topCenter,
        //     end: Alignment.bottomCenter,
        //   ),
        // ),
        title: Text(
          'موعد المناسبة',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22.0,
          ),
        ),
        elevation: 3.0,
        iconTheme: IconThemeData(color: Colors.white),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(16.0),
          child: Container(),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                initialDateTime: _selectedDate,
                minimumDate: DateTime.now().date,
                maximumDate: endDate,
                onDateTimeChanged: (DateTime newDateTime) {
                  // Update the local variable
                  selectedDateTemp = newDateTime.date;
                  setState(() {
                    _selectedDate = newDateTime.date;
                    timeSelected = false;
                    buttonColor = Colors.grey;
                  });
                },
              ),
            ),
          ),
          SizedBox(height: 100.0),
          Container(
            alignment: Alignment.bottomLeft,
            padding: EdgeInsets.only(left: 20.0, bottom: 20.0),
            child: Row(
              children: [
                Text(
                  'التالي',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: buttonColor,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.arrow_forward, color: buttonColor),
                  onPressed: () {
                    // Only update the provider when the user finalizes the selection
                    reqProvider.addReq(selectedDateTemp.toString());

                    // Show the dialog
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text(
                            'تم اختيار التاريخ',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          content: Text(
                            'تم اختيار التاريخ: ${DateFormat('yyyy-MM-dd').format(selectedDateTemp)}',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('موافق'),
                            ),
                          ],
                        );
                      },
                    );
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Reservation2(),
                        ));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

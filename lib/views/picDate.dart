import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoDatePickerPage extends StatefulWidget {
  @override
  _CupertinoDatePickerPageState createState() => _CupertinoDatePickerPageState();
}

class _CupertinoDatePickerPageState extends State<CupertinoDatePickerPage> {
  DateTime _selectedDate = DateTime.now();
  String _selectedTimeRange = '';
  List<String> timeRanges = ['6:00-8:00', '6:00-9:00', '9:00-11:00', '4:00-7:00', '5:00-8:00', '8:00-11:00', '7:00-9:00'];
  bool timeSelected = false;
  int selectedTimeIndex = -1;
  Color buttonColor = Colors.grey; // Set initial button color to grey

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF5BA581),
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
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: CupertinoDatePicker(
                          mode: CupertinoDatePickerMode.date,
                          initialDateTime: _selectedDate,
                          onDateTimeChanged: (DateTime newDateTime) {
                            setState(() {
                              _selectedDate = newDateTime;
                              timeSelected = false;
                              buttonColor = Colors.grey; // Reset button color to grey when date changes
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 70.0),
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 10.0,
                    runSpacing: 10.0,
                    children: List.generate(timeRanges.length, (index) {
                      return ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _selectedTimeRange = timeRanges[index];
                            selectedTimeIndex = index;
                            timeSelected = true;
                            buttonColor = Color(0xFF5BA581); // Change button color when time is selected
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          primary: selectedTimeIndex == index ? buttonColor : Colors.grey, // Use buttonColor variable
                          onPrimary: Colors.white,
                          side: BorderSide(color: selectedTimeIndex == index ? Colors.grey : Colors.grey),
                        ),
                        child: Text(timeRanges[index]),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
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
                    color: buttonColor, // Use buttonColor variable
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.arrow_forward, color: buttonColor), // Use buttonColor variable
                  onPressed: () {
                    // Perform the action to move to the next step
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

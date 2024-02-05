import 'package:flutter/material.dart';
import 'package:flutter_application/views/date2.dart';
import 'package:flutter_application/views/profile3.dart';

class review extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('اختر المخطط', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF5BA581),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Container 1
            Container(
              height: 200,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Dana events',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    ' نوع الحدث: حفلات و زفاف', // Add the eventType here
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'التقييم',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 5),
                      Icon(Icons.star, color: Colors.yellow),
                      Icon(Icons.star, color: Colors.yellow),
                      Icon(Icons.star_border, color: Colors.yellow),
                      Icon(Icons.star_border, color: Colors.yellow),
                      Icon(Icons.star_border, color: Colors.yellow),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    'الراتب: NIS 2000',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: ElevatedButton(
                        onPressed: () {
                       
 Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>   ProfilePage3()), // Replace 'NextPage' with the actual name of your next page
    );

                          // Display confirmation message
                          // showDialog(
                          //   context: context,
                          //   builder: (BuildContext context) {
                          //     return AlertDialog(
                          //       title: Text('تأكيد الحجز'),
                          //       content: Text('هل تريد حقًا حجز هذا المخطط؟'),
                          //       actions: [
                          //         TextButton(
                          //           onPressed: () {
                          //             Navigator.of(context).pop();
                          //             // Perform the booking action here
                          //             // For example: Navigate to the booking screen
                          //           },
                          //           child: Text('نعم'),
                          //         ),
                          //         TextButton(
                          //           onPressed: () {
                          //             Navigator.of(context).pop();
                          //           },
                          //           child: Text('لا'),
                          //         ),
                          //       ],
                          //     );
                          //   },
                          // );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFF5BA581),
                        ),
                        child: Text(
                          'احجز',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Container 2
            Container(
              height: 200,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Hala events',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'نوع الحدث: احتفال', // Add the eventType here
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'التقييم',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 5),
                      Icon(Icons.star, color: Colors.yellow),
                      Icon(Icons.star, color: Colors.yellow),
                      Icon(Icons.star, color: Colors.yellow),
                      Icon(Icons.star_border, color: Colors.yellow),
                                            Icon(Icons.star_border, color: Colors.yellow),

                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    'الراتب: NIS 6000',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: ElevatedButton(
                        onPressed: () {
Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>   ProfilePage3()), // Replace 'NextPage' with the actual name of your next page
     );   //                       showDialog(
    //                         context: context,
    //                         builder: (BuildContext context) {
    //                           return AlertDialog(
    //                             title: Text('تأكيد الحجز'),
    //                             content: Text('هل تريد حقًا حجز هذا المخطط؟'),
    //                             actions: [
    //                               TextButton(
    //                                 onPressed: () {
    //                                   Navigator.of(context).pop();
    //                                   // Perform the booking action here
    //                                   // For example: Navigate to the booking screen
    //                                 },
    //                                 child: Text('نعم'),
    //                               ),
    //                               TextButton(
    //                                 onPressed: () {
    //                                   Navigator.of(context).pop();
    //                                 },
    //                                 child: Text('لا'),
    //                               ),
    //                             ],
    //                           );
    //                         },
    //                       );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFF5BA581),
                        ),
                        child: Text(
                          'احجز',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Container 3
            Container(
              height: 200,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Sema events',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'نوع الحدث: مناسبة', // Add the eventType here
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'التقييم',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 5),
                      Icon(Icons.star, color: Colors.yellow),
                      Icon(Icons.star, color: Colors.yellow),
                      Icon(Icons.star, color: Colors.yellow),
                      Icon(Icons.star, color: Colors.yellow),
                      Icon(Icons.star_border, color: Colors.yellow),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    'الراتب: NIS 5500',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: ElevatedButton(
                        onPressed: () {
                          // Display confirmation message
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                              title: Text(
        'تأكيد الحجز',
        style: TextStyle(
          fontSize: 20, // Adjust the font size as needed
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Text(
        'هل تريد حقًا حجز هذا المخطط؟',
        style: TextStyle(
          fontSize: 1, // Adjust the font size as needed
          fontWeight: FontWeight.bold,
        ),
      ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                     Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>   ProfilePage3()), // Replace 'NextPage' with the actual name of your next page
    );
                                    },
                                    child: Text('نعم',style: TextStyle(
          fontSize: 16, // Adjust the font size as needed
          fontWeight: FontWeight.bold,
        ),),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('لا',   style: TextStyle(
          fontSize: 16, // Adjust the font size as needed
          fontWeight: FontWeight.bold,
        ),),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFF5BA581),
                        ),
                        child: Text(
                          'احجز',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

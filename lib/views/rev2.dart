import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:flutter_application/views/NewProvider.dart';

class Review2 extends StatefulWidget {
  const Review2({Key? key}) : super(key: key);

  @override
  _ReviewState createState() => _ReviewState();
}

class _ReviewState extends State<Review2> {
  List<List<double>> userRatings = List.generate(3, (_) => [0.0]);
  List<List<TextEditingController>> commentControllers = List.generate(3, (_) => [TextEditingController()]);
  List<List<String>> comments = List.generate(3, (_) => ['']);
  static const String postReviewUrl = 'http://192.168.1.6:4001/login1/review';
Future<void> postReview(int index) async {
final String username = Provider.of<NewProvider>(context, listen: false).getUsername;

  final String plannername = 'hala events';
  final String comment = comments[index][0];
  final String star = userRatings[index][0].toString();

  try {
    final response = await http.post(
      Uri.parse(postReviewUrl),
      body: {
        'username': username,
        'plannername': plannername,
        'comment': comment,
        'star': star,
      },
    );

    if (response.statusCode == 201) {
      print('Review posted successfully');
    } else {
      print('Failed to post review. Status code: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
  } catch (error) {
    print('Error posting review: $error');
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('قيم المخطط'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Container 1
          //  buildContainer(0, 'Shahd events'),

            // Container 2
            buildContainer(1, 'Hala events'),

            // Container 3
          //  buildContainer(2, 'Sema events'),

            // Add more containers with buttons as needed
          ],
        ),
      ),
    );
  }

  Widget buildContainer(int index, String eventName) {
    return Container(
      height: 250,
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
            eventName,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
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
              RatingBar.builder(
                initialRating: userRatings[index][0],
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: false,
                itemCount: 5,
                itemSize: 20,
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.orange,
                ),
                onRatingUpdate: (rating) {
                  setState(() {
                    userRatings[index][0] = rating;
                  });
                },
              ),
            ],
          ),
          SizedBox(height: 10),
          Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('قم بالتقييم'),
                      content: Column(
                        children: [
                          Text('قم بتقييم هذا المخطط باستخدام النجوم'),
                          SizedBox(height: 10),
                          RatingBar.builder(
                            initialRating: userRatings[index][0],
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: false,
                            itemCount: 5,
                            itemSize: 30,
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.orange,
                            ),
                            onRatingUpdate: (rating) {
                              setState(() {
                                userRatings[index][0] = rating;
                              });
                            },
                          ),
                          SizedBox(height: 10),
                          // Comment input field
                          TextFormField(
                            controller: commentControllers[index][0],
                            decoration: InputDecoration(
                              labelText: 'اكتب تعليقك هنا',
                            ),
                            onChanged: (value) {
                              setState(() {
                                comments[index][0] = value;
                              });
                            },
                          ),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: ()async {
                                                        await postReview(index);

                            Navigator.of(context).pop();
                            // Save the rating or perform any other action
                          },
                          child: Text('تأكيد'),
                        ),
                        TextButton(
                          onPressed: () async {
                            // Make the POST request here before closing the dialog
                            Navigator.of(context).pop();
                          },
                          child: Text('إلغاء'),
                        ),
                      ],
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
              ),
              child: Text(
                'قم بالتقييم',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          // Display comment
          if (comments[index][0].isNotEmpty)
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'التعليق: ${comments[index][0]}',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

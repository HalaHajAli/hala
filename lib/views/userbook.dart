import 'package:flutter/material.dart';

class EventDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF5BA581),
        title: Text(
          ' تفاصيل الحجز',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16),
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildDetailRow('المخطط', 'hala'),
              buildDetailRow('اسم العرض', 'summer2024 '),
              buildDetailRow('المستخدم', 'shahd'),
              buildDetailRow('لون الزينة', 'red '),
              buildDetailRow('المطعم', 'lemon w n3n3 '),
              buildDetailRow('تاريخ', '30-09-2024 '),
              buildDetailRow('الوقت', '6-8 PM '),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Handle cancel reservation action
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF5BA581),
                ),
                child: Text(
                  'إلغاء الحجز',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDetailRow(String title, String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          SizedBox(width: 8),
          Text(
            content,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

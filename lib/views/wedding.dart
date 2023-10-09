import 'package:flutter/material.dart';

class ServiceItem {
  final String name;
  final String description;
  final AssetImage image;

  ServiceItem({
    required this.name,
    required this.description,
    required this.image,
  });
}

class ServiceDetailPage extends StatelessWidget {
  final ServiceItem service;

  ServiceDetailPage({required this.service});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(service.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(image: service.image, height: 200, width: 200),
            SizedBox(height: 20),
            Text(
              'Service Name: ${service.name}',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Text(
              'Description: ${service.description}',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

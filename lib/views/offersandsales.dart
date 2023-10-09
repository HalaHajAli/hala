import 'package:flutter/material.dart';
import 'package:flutter_application/views/servicepage.dart'; // Import the service page

class OffersAndSalesPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Offers and Sales'),
      ),
      body: SingleChildScrollView( // Wrap the content in SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Latest Offers:',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              OfferCard(
                title: '50% Off on Electronics',
                description: 'Get a discount on all electronics items.',
                imagePath: 'assets/electronics_offer.png',
              ),
              OfferCard(
                title: 'Summer Sale',
                description: 'Enjoy our summer sale with great discounts.',
                imagePath: 'assets/summer_sale.png',
              ),
              SizedBox(height: 20),
              Text(
                'Recent Sales:',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              SaleItem(
                productName: 'Smartphone',
                salePrice: 299.99,
                originalPrice: 399.99,
                imagePath: 'assets/smartphone.png',
              ),
              SaleItem(
                productName: 'Laptop',
                salePrice: 699.99,
                originalPrice: 899.99,
                imagePath: 'assets/laptop.png',
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to the ServicePage when the "Skip" button is pressed
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ServicePage(userType: 'visitor'), // You can pass the user type as needed
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green, // Set the button color to green
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
                    child: Text('Skip'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OfferCard extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;

  OfferCard({
    required this.title,
    required this.description,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: [
          Image.asset(
            imagePath,
            height: 150,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                Text(
                  description,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SaleItem extends StatelessWidget {
  final String productName;
  final double salePrice;
  final double originalPrice;
  final String imagePath;

  SaleItem({
    required this.productName,
    required this.salePrice,
    required this.originalPrice,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: ListTile(
        leading: Image.asset(
          imagePath,
          height: 100,
          width: 100,
          fit: BoxFit.cover,
        ),
        title: Text(
          productName,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sale Price: \$${salePrice.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Original Price: \$${originalPrice.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 16,
                decoration: TextDecoration.lineThrough,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

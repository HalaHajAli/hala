import 'package:flutter/material.dart';
import 'package:flutter_application/views/servicepage.dart';

class OffersAndSalesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Offers and Sales'),
        backgroundColor: Color(0xFF5BA581),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Latest Offers:',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 200.0, // Set the desired height for the offers section
                  child: OffersListView(),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Recent Sales:',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 200.0, // Set the desired height for the sales section
                  child: SalesListView(),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 16.0, // Adjust the vertical position
            right: 16.0, // Adjust the horizontal position
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ServicePage(userType: 'visitor',usern:"" ,ema:""),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.transparent, // Set background color to transparent
                elevation: 0, // Remove shadow
              ),
              child: Text(
                'Skip',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Text color
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
class OffersListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Replace with your list of offer items
    List<OfferItem> offers = [
      OfferItem(
        title: '50% Off on Electronics',
        description: 'Get a discount on all electronics items.',
        imagePath: 'assets/electronics_offer.png',
      ),
      OfferItem(
        title: 'Summer Sale',
        description: 'Enjoy our summer sale with great discounts.',
        imagePath: 'assets/summer_sale.png',
      ),
      // Add more offers as needed
    ];

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: offers.length,
      itemBuilder: (context, index) {
        OfferItem offer = offers[index];
        return OfferCard(offer: offer);
      },
    );
  }
}

class SalesListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Replace with your list of sale items
    List<SaleItem> sales = [
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
      // Add more sale items as needed
    ];

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: sales.length,
      itemBuilder: (context, index) {
        SaleItem sale = sales[index];
        return SaleCard(sale: sale);
      },
    );
  }
}

class OfferItem {
  final String title;
  final String description;
  final String imagePath;

  OfferItem({
    required this.title,
    required this.description,
    required this.imagePath,
  });
}

class SaleItem {
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
}

class OfferCard extends StatelessWidget {
  final OfferItem offer;

  OfferCard({required this.offer});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Image.asset(
            offer.imagePath,
            height: 120.0,
            width: 200.0,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  offer.title,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  offer.description,
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SaleCard extends StatelessWidget {
  final SaleItem sale;

  SaleCard({required this.sale});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Image.asset(
            sale.imagePath,
            height: 120.0,
            width: 200.0,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  sale.productName,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Sale Price: \$${sale.salePrice.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                Text(
                  'Original Price: \$${sale.originalPrice.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 16.0,
                    decoration: TextDecoration.lineThrough,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

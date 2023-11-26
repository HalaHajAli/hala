import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter_application/views/login.dart';

class ServiceItem {
  final String id;
  final String serviceName;

  ServiceItem({
    required this.id,
    required this.serviceName,
  });
}

class OfferItem {
  final String title;
  final String description;
  final String imagePath;

  OfferItem({
    String title = '',
    String description = '',
    String imagePath = '',
  })  : title = title,
        description = description,
        imagePath = imagePath;
}

class SaleItem {
  final String id;
  final String productName;
  final double salePrice;
  final double originalPrice;
  final String imagePath;

  SaleItem({
    required this.id,
    required this.productName,
    required this.salePrice,
    required this.originalPrice,
    required this.imagePath,
  });
}

class SalesOffersProvider extends ChangeNotifier {
  List<SaleItem> sales = [];
  List<OfferItem> offers = [];
  List<String> services = [];

  void addSale(SaleItem sale) {
    sales.add(sale);
    notifyListeners();
  }

  void addOffer(OfferItem offer) {
    offers.add(offer);
    notifyListeners();
  }

  void addService(String serviceName) {
    services.add(serviceName);
    notifyListeners();
  }

  void removeService(String serviceName) {
    services.remove(serviceName);
    notifyListeners();
  }
}



class AdminServicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SalesOffersProvider(),
      child: _AdminServicePage(),
    );
  }
}

class _AdminServicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Service Page'),
        backgroundColor: Color(0xFF5BA581),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Image.asset(
                'images/monasaba.png',
                width: 150,
                height: 150,
              ),
              SizedBox(height: 20),
              Text(
                'Add Sale:',
                style: TextStyle(fontSize: 18),
              ),
              _buildSaleForm(context),
              SizedBox(height: 20),
              Text(
                'Add Offer:',
                style: TextStyle(fontSize: 18),
              ),
              _buildOfferForm(context),
              SizedBox(height: 20),
              Text(
                'Current Sales:',
                style: TextStyle(fontSize: 18),
              ),
              _buildSalesList(context),
              SizedBox(height: 20),
              Text(
                'Current Offers:',
                style: TextStyle(fontSize: 18),
              ),
              _buildOffersList(context),
              SizedBox(height: 20),
              Text(
                'Manage Services:',
                style: TextStyle(fontSize: 18),
              ),
              _buildServiceManagement(context),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.reactCircle,
        backgroundColor: Color(0xFF5BA581),
        items: [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.person, title: 'Profile'),
        ],
        onTap: (int index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AdminProfilePage()),
            );
          }
        },
      ),
    );
  }
Widget _buildServiceManagement(BuildContext context) {
    return Column(
      children: [
        _greenElevatedButton(
          onPressed: () {
            // Add service functionality
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('Add Service'),
                content: ServiceForm(),
              ),
            );
          },
          text: 'Add Service',
          icon: Icons.add,
        ),
        SizedBox(height: 10),
        _greenElevatedButton(
          onPressed: () {
            // Remove service functionality
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('Remove Service'),
                content: RemoveServiceForm(),
              ),
            );
          },
          text: 'Remove Service',
          icon: Icons.remove,
        ),
      ],
    );
  }
  Widget _buildSaleForm(BuildContext context) {
    return Column(
      children: [
        _greenElevatedButton(
          onPressed: () {
            _pickImage(context);
          },
          text: 'Pick Image',
          icon: Icons.image, // Example icon
        ),
        SizedBox(height: 10),
        _greenElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('Add Sale'),
                content: SaleForm(),
              ),
            );
          },
          text: 'Add Sale Form',
          icon: Icons.add, // Example icon
        ),
      ],
    );
  }

  Widget _buildOfferForm(BuildContext context) {
    return Column(
      children: [
        _greenElevatedButton(
          onPressed: () {
            _pickImage(context);
          },
          text: 'Pick Image',
          icon: Icons.image, // Example icon
        ),
        SizedBox(height: 10),
        _greenElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('Add Offer'),
                content: OfferForm(),
              ),
            );
          },
          text: 'Add Offer Form',
          icon: Icons.add, // Example icon
        ),
      ],
    );
  }

  Widget _buildSalesList(BuildContext context) {
    final provider = Provider.of<SalesOffersProvider>(context);

    return Column(
      children: provider.sales.map((sale) {
        return Card(
          margin: EdgeInsets.all(8.0),
          child: ListTile(
            title: Text(sale.productName),
            subtitle: Text('Sale Price: \$${sale.salePrice.toStringAsFixed(2)}'),
            leading: Image.asset(sale.imagePath, width: 50, height: 50),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildOffersList(BuildContext context) {
    final provider = Provider.of<SalesOffersProvider>(context);

    return Column(
      children: provider.offers.map((offer) {
        return Card(
          margin: EdgeInsets.all(8.0),
          child: ListTile(
            title: Text(offer.title),
            subtitle: Text(offer.description),
            leading: Image.asset(offer.imagePath, width: 50, height: 50),
          ),
        );
      }).toList(),
    );
  }

  Future<void> _pickImage(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      Provider.of<SalesOffersProvider>(context, listen: false).addSale(
        SaleItem(
          id: 'unique_id', // Provide a unique id
          productName: 'New Product',
          salePrice: 49.99,
          originalPrice: 99.99,
          imagePath: pickedFile.path,
        ),
      );
    }
  }

  ElevatedButton _greenElevatedButton({
  required VoidCallback onPressed,
  required String text,
  IconData? icon,
}) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: Color(0xFF5BA581), // Green color for the button
        minimumSize: Size(150, 40), // Set the minimum width and height

      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) Icon(icon, color: Colors.white),
          SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
class ServiceForm extends StatelessWidget {
  ElevatedButton _greenElevatedButton({
    required VoidCallback onPressed,
    required String text,
    IconData? icon,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: Color(0xFF5BA581), // Green color for the button
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) Icon(icon, color: Colors.white),
          SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SalesOffersProvider>(context);
    final TextEditingController serviceNameController = TextEditingController();

    return Column(
      children: [
        TextField(
          controller: serviceNameController,
          decoration: InputDecoration(labelText: 'Service Name'),
        ),
        _greenElevatedButton(
          onPressed: () {
            if (serviceNameController.text.isNotEmpty) {
              provider.addService(
                serviceNameController.text,
              );
              serviceNameController.clear();
              Navigator.pop(context); // Close the dialog after adding the service
            }
          },
          text: 'Add Service',
          icon: Icons.add,
        ),
      ],
    );
  }
}

class RemoveServiceForm extends StatelessWidget {
  ElevatedButton _greenElevatedButton({
    required VoidCallback onPressed,
    required String text,
    IconData? icon,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: Color(0xFF5BA581), // Green color for the button
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) Icon(icon, color: Colors.white),
          SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController serviceNameController = TextEditingController();

    return Column(
      children: [
        TextField(
          controller: serviceNameController,
          decoration: InputDecoration(labelText: 'Service Name'),
        ),
        _greenElevatedButton(
          onPressed: () {
            if (serviceNameController.text.isNotEmpty) {
              Provider.of<SalesOffersProvider>(context, listen: false).removeService(
                serviceNameController.text,
              );
              serviceNameController.clear();
              Navigator.pop(context); // Close the dialog after removing the service
            }
          },
          text: 'Remove Service',
          icon: Icons.remove,
        ),
      ],
    );
  }
}


class SaleForm extends StatelessWidget {
  ElevatedButton _greenElevatedButton({
    required VoidCallback onPressed,
    required String text,
    IconData? icon,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: Color(0xFF5BA581), // Green color for the button
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) Icon(icon, color: Colors.white),
          SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SalesOffersProvider>(context);
    final TextEditingController productNameController = TextEditingController();
    final TextEditingController originalPriceController = TextEditingController();
    final TextEditingController salePriceController = TextEditingController();

    return Column(
      children: [
        TextField(
          controller: productNameController,
          decoration: InputDecoration(labelText: 'Product Name'),
        ),
        TextField(
          controller: originalPriceController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(labelText: 'Original Price'),
        ),
        TextField(
          controller: salePriceController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(labelText: 'Sale Price'),
        ),
        _greenElevatedButton(
          onPressed: () {
            if (productNameController.text.isNotEmpty &&
                originalPriceController.text.isNotEmpty &&
                salePriceController.text.isNotEmpty) {
              provider.addSale(
                SaleItem(
                  id: 'unique_id', // Provide a unique id
                  productName: productNameController.text,
                  originalPrice: double.parse(originalPriceController.text),
                  salePrice: double.parse(salePriceController.text),
                  imagePath: 'images/default_image.png',
                ),
              );
              productNameController.clear();
              originalPriceController.clear();
              salePriceController.clear();
              Navigator.pop(context); // Close the dialog after adding the sale
            }
          },
          text: 'Add Sale',
          icon: Icons.add, // Example icon
        ),
      ],
    );
  }
}
class OfferForm extends StatelessWidget {
  ElevatedButton _greenElevatedButton({
    required VoidCallback onPressed,
    required String text,
    IconData? icon,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: Color(0xFF5BA581), // Green color for the button
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) Icon(icon, color: Colors.white),
          SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SalesOffersProvider>(context);
    final TextEditingController titleController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();

    return Column(
      children: [
        TextField(
          controller: titleController,
          decoration: InputDecoration(labelText: 'Title'),
        ),
        TextField(
          controller: descriptionController,
          decoration: InputDecoration(labelText: 'Description'),
        ),
        _greenElevatedButton(
          onPressed: () {
            if (titleController.text.isNotEmpty && descriptionController.text.isNotEmpty) {
              provider.addOffer(
                OfferItem(
                  title: titleController.text,
                  description: descriptionController.text,
                  imagePath: 'images/default_image.png',
                ),
              );
              titleController.clear();
              descriptionController.clear();
              Navigator.pop(context); // Close the dialog after adding the offer
            }
          },
          text: 'Add Offer',
          icon: Icons.add, // Example icon
        ),
      ],
    );
  }
}
class AdminProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Profile'),
        backgroundColor: Color(0xFF5BA581),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                _pickProfileImage(context);
              },
              child: CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('images/blank-profile-circle.png'), // Replace with the path to the admin's avatar image
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Admin Name',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'admin@example.com',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement logout functionality
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                ); // Go back to the previous screen (AdminServicePage)
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF5BA581),
                minimumSize: Size(150, 40),
              ),
              child: Text(
                'Logout',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickProfileImage(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      // Handle the selected profile image (upload, store locally, etc.)
      // You may want to update the UI with the new image.
    }
  }
}
class AddServiceForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add Service'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Add form fields or any other input elements you need for adding a service
          TextField(
            decoration: InputDecoration(labelText: 'Service Name'),
          ),
          // Add more form fields if needed
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            // Add logic to save the service or perform any necessary actions
            Navigator.of(context).pop(); // Close the dialog
          },
          child: Text('Add'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          child: Text('Cancel'),
        ),
      ],
    );
  }
}

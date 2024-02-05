import 'package:flutter/material.dart';
import 'package:flutter_application/views/servicepage.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application/views/budget.dart'; // Import the BudgetProvider

class AddItemPage extends StatefulWidget {
  @override
  _AddItemPageState createState() => _AddItemPageState();
}

class _AddItemPageState extends State<AddItemPage> {
  String location = '';
  final TextEditingController budgetController = TextEditingController(); // Add a controller for the budget field
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _saveData(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      // Access the BudgetProvider instance
      final budgetProvider = Provider.of<BudgetProvider>(context, listen: false);

      budgetProvider.budget = budgetController.text;

      print('Budget stored in the provider: ${budgetProvider.budget}');
       Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ServicePage(userType: "", usern: "", ema: "")),
    );

    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'ادخل معلوماتك',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color.fromARGB(255, 91, 165, 129),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 20),
                Text(
                  'إضافة الموقع:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                TextFormField(
                  onChanged: (value) {
                    setState(() {
                      location = value;
                    });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintText: 'أدخل الموقع',
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'إضافة الميزانية:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: budgetController,
                  onChanged: (value) {
                    // You can update the budget directly here if needed
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintText: 'أدخل الميزانية',
                  ),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () => _saveData(context),
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 91, 165, 129),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      'حفظ',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

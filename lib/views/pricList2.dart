import 'package:flutter/material.dart';
import 'package:flutter_application/views/flower.dart';
import 'package:flutter_application/views/offerProvider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application/views/picDate.dart';

class YourPage2 extends StatefulWidget {
  @override
  _YourPageState createState() => _YourPageState();
}

class _YourPageState extends State<YourPage2> {
  String selectedElement = 'تنسيق الزهور';
  List<String> elementList = ['تنسيق الزهور', 'قائمة الطعام', 'القاعة', 'قائمة الحضور'];

  Map<String, String> itemContextMap = {
    'تنسيق الزهور': '\n لدينا سيكون بإمكانك إختيار لون الزهور الذي تريد وضعه في مناسبتك...',
    'قائمة الطعام': '\n في قائمة الطعام لدينا تجد كل الأصناف التي قد تحتاجها على المائدة...',
    'القاعة': ' لدينا ستجد إقتراحات للمكان الذي ستقيم به مناسبتك بمختلف التصاميم...',
    'قائمة الحضور': '  بإستخدام قائمة الحضور المدرجة في تطبيقنا تستطيع إضافة أسماء...',
  };

  @override
  Widget build(BuildContext context) {
    final offerProvider = Provider.of<OfferProvider>(context);
    List<String> offerList = offerProvider.offer;

    if (offerList.isNotEmpty) {
      String firstItem = offerList.first;
      print(firstItem);
    } else {
      print('The offer list is empty.');
    }

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text(' '),
        ),
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.white, Color(0xFF5BA581)],
              ),
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'الخدمات  :',
                        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      if (elementList.isNotEmpty)
                        DropdownButton<String>(
                          value: selectedElement,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedElement = newValue!;
                            });
                          },
                          items: elementList
                              .map<DropdownMenuItem<String>>(
                                (String value) => DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                ),
                              )
                              .toList(),
                        ),
                    ],
                  ),
                ),
                SizedBox(height: 8.0),
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: getContainersBasedOnSelection(selectedElement),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> getContainersBasedOnSelection(String selectedElement) {
    List<String> containerTitles = ['تنسيق الزهور', 'قائمة الطعام', 'القاعة', 'قائمة الحضور'];

    containerTitles.remove(selectedElement);
    containerTitles.insert(0, selectedElement);

    return containerTitles.map((title) {
      return Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.white,
            ),
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                ),
                SizedBox(height: 12.0),
                Text(
                  itemContextMap[title] ?? '',
                  style: TextStyle(fontSize: 16.0, color: Colors.black),
                ),
                SizedBox(height: 16.0),
                if (title == containerTitles.first) // Display button for the first item
                  ElevatedButton(
                    onPressed: () {
                      handleButtonPress(title);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: getButtonColor(title),
                      onPrimary: Colors.white,
                      textStyle: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    child: getButtonText(title),
                  ),
                if (title == containerTitles[2]) // Display button for the third item
                  ElevatedButton(
                    onPressed: () {
                      handleButtonPress(title);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: getButtonColor(title),
                      onPrimary: Colors.white,
                      textStyle: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    child: Text('احجز الموعد'), // Customize the button text
                  ),
                if (title == containerTitles.last) // Display button for the last item
                  ElevatedButton(
                    onPressed: () {
                      handleButtonPress(title);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: getButtonColor(title),
                      onPrimary: Colors.white,
                      textStyle: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    child: getButtonText(title),
                  ),
              ],
            ),
          ),
          SizedBox(height: 16.0),
        ],
      );
    }).toList();
  }

  void handleButtonPress(String title) {
    switch (title) {
      case 'تنسيق الزهور':
        navigateToFlowerArrangementPage(context);
        break;

        case 'احجز الموعد':
        navigateToFlowerArrangementPage2(context);
        break;
      // Handle button press for other cases if needed
    }
  }

  void navigateToFlowerArrangementPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FlowerColorPage(),
      ),
    );
  }

  void navigateToFlowerArrangementPage2(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CupertinoDatePickerPage (),
      ),
    );
  }

  Color getButtonColor(String title) {
    switch (title) {
      case 'تنسيق الزهور':
        return Color(0xFF5BA581);
      default:
        return Color(0xFF5BA581); // Default color for other cases
    }
  }

  Widget getButtonText(String title) {
    switch (title) {
      case 'تنسيق الزهور':
        return Text('تنسيق الزهور');
      default:
        return Text('قائمة الحضور'); // Default text for other cases
    }
  }
}

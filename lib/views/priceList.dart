import 'package:flutter/material.dart';
import 'package:flutter_application/views/flower.dart';
import 'package:flutter_application/views/offerProvider.dart';
import 'package:provider/provider.dart'; // Import the Provider package
import 'package:flutter_application/views/food.dart';
import 'package:flutter_application/views/picDate.dart';
import 'package:flutter_application/views/guestList.dart';

class YourPage extends StatefulWidget {

  YourPage();

  @override
  _YourPageState createState() => _YourPageState();
}

class _YourPageState extends State<YourPage> {
  String selectedElement = 'تنسيق الزهور';
  List<String> elementList = [
    'تنسيق الزهور',
    'قائمة الطعام',
    'القاعة',
    'قائمة الحضور'
  ];

  Map<String, String> itemContextMap = {
    'تنسيق الزهور':
        '\n لدينا سيكون بإمكانك إختيار لون الزهور الذي تريد وضعه في مناسبتك وسيتم عرض الزهور التي تطابق اللون الذي قمت بإختياره  ',
    'قائمة الطعام':
        '\n في قائمة الطعام لدينا تجد كل الأصناف التي قد تحتاجها على المائدة في مناسبتك وأيضاً ستجد أفضل الأماكن التي ستعد لك أشهى أنواع الحلويات ',
    'القاعة':
        ' لدينا ستجد إقتراحات للمكان الذي ستقيم به مناسبتك بمختلف التصاميم والإطلالات للقاعات الخارجية , وأيضاً يمكنك تطبيقنا من تحميل صورة المكان الخاص بك إن كنت تملك مكاناً تود إنشاء مناسبتك به وأيضاً أتحنى لك إمكانية التواصل مع القاعات المتوفرة لدينا وقراءة التفاصيل عن كل قاعة من حيث عدد الحضور المناسب وبقية التفاصيل ',
    'قائمة الحضور':
        '  بإستخدام قائمة الحضور المدرجة في تطبيقنا تستطيع إضافة أسماء كل شخص تود دعوته إلى مناسبتك ومن ثم تستطيع تعديل الإسم أو حذفه وأيضاً عند الإنتهاء من هذا الشخص تستطيع وضع إشارة بجانب إسمه ',
  };

// Inside the page or widget where you have access to OfferProvider







  @override
  Widget build(BuildContext context) {
final offerProvider = Provider.of<OfferProvider>(context);
  List<String> offerList = offerProvider.offer;

  // Check if the list is not empty before printing
  if (offerList.isNotEmpty) {
    print("Printing all values in the offer list:");
    
    for (String offer in offerList) {
      print(offer);
    }
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
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
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
    List<String> containerTitles = [
      'تنسيق الزهور',
      'قائمة الطعام',
      'القاعة',
      'قائمة الحضور'
    ];

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
                ElevatedButton(
                  onPressed: () {
                    // Handle button press here
                    // You can use the 'title' variable to identify the selected item
                    handleButtonPress(title);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: getButtonColor(
                        title), // Set button color based on title
                    onPrimary: Colors.white, // Set text color to white
                    textStyle: TextStyle(
                        fontWeight: FontWeight.bold), // Set text style
                  ),
                  child:
                      getButtonText(title), // Adjust button text based on title
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
    // Add specific functionality for each button based on the title
    switch (title) {
      case 'تنسيق الزهور':
        navigateToFlowerArrangementPage(context);
        break;
      case 'قائمة الطعام':
        navigateToFlowerArrangementPage2(context);
        break;
      case 'القاعة':
        navigateToFlowerArrangementPage3(context);
        break;
      case 'قائمة الحضور':
        navigateToFlowerArrangementPage4(context);
        break;
      default:
        break;
    }
  }

  void navigateToFlowerArrangementPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              FlowerColorPage()), 
    );
  }


   void navigateToFlowerArrangementPage2(BuildContext context) {
   
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              FoodManagementPage()), 
    );
  }



   void navigateToFlowerArrangementPage3(BuildContext context) {
   
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              CupertinoDatePickerPage()), 
    );
  }


   void navigateToFlowerArrangementPage4(BuildContext context) {
   
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
         GuestListPage()), 
    );
  }

  Color getButtonColor(String title) {
    // Adjust button color based on title
    switch (title) {
      case 'تنسيق الزهور':
        return Color(0xFF5BA581);
      case 'قائمة الطعام':
        return Color(0xFF5BA581);
      case 'القاعة':
        return Color(0xFF5BA581);
      case 'قائمة الحضور':
        return Color(0xFF5BA581);
      default:
        return Color(0xFF5BA581);
    }
  }

  Widget getButtonText(String title) {
    // Adjust button text based on title
    switch (title) {
      case 'تنسيق الزهور':
        return Text('تنسيق الزهور');
      case 'قائمة الطعام':
        return Text('قائمة الطعام');
      case 'القاعة':
        return Text('القاعة');
      case 'قائمة الحضور':
        return Text('قائمة الحضور');
      default:
        return Text('Button');
    }
  }
}

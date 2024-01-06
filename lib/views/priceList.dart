import 'package:flutter/material.dart'; 
 
class YourPage extends StatefulWidget { 
  @override 
  _YourPageState createState() => _YourPageState(); 
} 
 
class _YourPageState extends State<YourPage> { 
  String selectedElement = 'تنسيق الزهور'; // Initial selected element 
  List<String> elementList = ['تنسيق الزهور', 'قائمة الطعام', 'القاعة', 'قائمة الحضور']; 
 
  // Map to associate each item with a specific context 
  Map<String, String> itemContextMap = { 
    'تنسيق الزهور': 'الأسعار: تبدأ الأسعار من 999 إلى 9999\n لدينا سيكون بإمكانك إختيار لون الزهور الذي تريد وضعه في مناسبتك وسيتم عرض الزهور التي تطابق اللون الذي قمت بإختياره  ', 
    'قائمة الطعام': ' الأسعار: تبدأ الأسعار من 999 إلى 9999 \n في قائمة الطعام لدينا تجد كل الأصناف التي قد تحتاجها على المائدة في مناسبتك وأيضاً ستجد أفضل الأماكن التي ستعد لك أشهى أنواع الحلويات ', 
    'القاعة': ' لدينا ستجد إقتراحات للمكان الذي ستقيم به مناسبتك بمختلف التصاميم والإطلالات للقاعات الخارجية , وأيضاً يمكنك تطبيقنا من تحميل صورة المكان الخاص بك إن كنت تملك مكاناً تود إنشاء مناسبتك به وأيضاً أتحنى لك إمكانية التواصل مع القاعات المتوفرة لدينا وقراءة التفاصيل عن كل قاعة من حيث عدد الحضور المناسب وبقية التفاصيل ', 
    'قائمة الحضور': '  بإستخدام قائمة الحضور المدرجة في تطبيقنا تستطيع إضافة أسماء كل شخص تود دعوته إلى مناسبتك ومن ثم تستطيع تعديل الإسم أو حذفه وأيضاً عند الإنتهاء من هذا الشخص تستطيع وضع إشارة بجانب إسمه ', 
  }; 
 
  @override 
  Widget build(BuildContext context) { 
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
                colors: [Colors.white, Colors.green], // White on top, green on bottom 
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
                      // Check if items list is not null or empty before creating the DropdownButton 
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
                SizedBox(height: 8.0), // Add a small space after the DropdownButton 
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
 
  List<Widget>


getContainersBasedOnSelection(String selectedElement) { 
    List<String> containerTitles = ['تنسيق الزهور', 'قائمة الطعام', 'القاعة', 'قائمة الحضور']; 
 
    containerTitles.remove(selectedElement); 
    containerTitles.insert(0, selectedElement); 
 
    return containerTitles.map((title) { 
      return Column( 
        children: [ 
          Container( 
            decoration: BoxDecoration( 
              border: Border.all(), 
              borderRadius: BorderRadius.circular(8.0), 
            ), 
            padding: EdgeInsets.all(16.0), 
            child: Column( 
              children: [ 
                Text( 
                  title, 
                  style: TextStyle(fontWeight: FontWeight.bold), 
                ), 
                SizedBox(height: 8.0), 
                Text( 
                  itemContextMap[title] ?? '', 
                  style: TextStyle(fontSize: 14.0), // Adjust font size as needed 
                ), 
              ], 
            ), 
          ), 
          SizedBox(height: 8.0), // Add a small space between each container 
        ], 
      ); 
    }).toList(); 
  } 
}

// ignore_for_file: prefer_const_constructors, dead_code, unnecessary_string_interpolations, prefer_const_literals_to_create_immutables

import 'package:clay_containers/constants.dart';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/views/imagePlace.dart';
import 'package:flutter_application/views/priceList.dart';
import 'package:flutter_application/views/newser2.dart';
import 'package:flutter_application/views/servicepage.dart';
import 'package:flutter_application/views/offerProvider.dart';
import 'package:flutter_application/views/pricList2.dart';
import 'package:flutter_application/views/PackProvider.dart';
import 'package:provider/provider.dart'; // Import the Provider package

class WeddingView extends StatefulWidget {
  final List<dynamic> packages; // Change the type to dynamic

  WeddingView({required this.packages});

  @override
  _WeddingViewState createState() => _WeddingViewState();
}

// List<Package> packageList = [];
// class Package {
//   String packageName;
//   int packagePrice;
//   Map<String, dynamic> mainPage;
//   Map<String, dynamic> imagePage;
//   Map<String, dynamic> detailsPage;

//   Package({
//     required this.packageName,
//     required this.packagePrice,
//     required this.mainPage,
//     required this.imagePage,
//     required this.detailsPage,
//   });
// }

class _WeddingViewState extends State<WeddingView> {
  List<Package> packageList = [];

  int maxLinesToShow = 3;
  Icon icon = Icon(
    Icons.thumb_up,
    color: Color(0xFF5BA581),
    size: 20,
  );
  String numLine = "المزيد";
  String usernameFromPackage = ""; // Declare the variable here

  //List<Package> packageList = [];

  @override
 void initState() {
    super.initState();

    // Access the PackageProvider
   

  }


  // void processPackages() {
  //   for (int i = 0; i < widget.packages.length; i++) {
  //     Map<String, dynamic> packageItem = widget.packages[i];
  //     Map<String, dynamic> mainPage = packageItem['mainPage'] ?? {};
  //     Map<String, dynamic> imagePage = packageItem['imagePage'] ?? {};
  //     List<String> images = imagePage['images'] ?? [];
  //     Map<String, dynamic> detailsPage = packageItem['detailsPage'] ?? {};

  //     String packageName = packageItem['name'] ?? 'Default Name';
  //     int packagePrice = packageItem['price'] is int
  //         ? packageItem['price']
  //         : int.tryParse(packageItem['price'].toString()) ?? 0;

  //     packageName = '$packageName ';

  //     if (packageItem.containsKey('packages') &&
  //         packageItem['packages'] is List) {
  //       List<dynamic> innerPackages = packageItem['packages'];
  //       for (int j = 0; j < innerPackages.length; j++) {
  //         Map<String, dynamic> innerPackage = innerPackages[j];
  //         Map<String, dynamic> innerMainPage = innerPackage['mainPage'] ?? {};
  //         Map<String, dynamic> innerImagePage = innerPackage['imagePage'] ?? {};
  //         List<dynamic> innerImages = innerImagePage['images'] ?? [];
  //         Map<String, dynamic> innerDetailsPage =
  //             innerPackage['detailsPage'] ?? {};

  //         String innerPackageName =
  //             innerPackage['name'] ?? 'Default Inner Name';
  //         int innerPackagePrice = innerPackage['price'] is int
  //             ? innerPackage['price']
  //             : int.tryParse(innerPackage['price'].toString()) ?? 0;

  //         innerPackageName = '$innerPackageName ';

  //         print('Inner Package Name: $innerPackageName');
  //         print('Inner Package Price: $innerPackagePrice');
  //         print('Inner Main Page: $innerMainPage');
  //         print('Inner Images: $innerImages');
  //         print('Inner Details Page: $innerDetailsPage');
  //       }
  //     } else {
  //       print('No inner packages found for Package $i');
  //     }

  //     Package package = Package(
  //       packageName: packageName,
  //       packagePrice: packagePrice,
  //       mainPage: mainPage,
  //       imagePage: imagePage,
  //       detailsPage: detailsPage,
  //     );

  //     packageList.add(package);
  //  //     print('Added package: ${package.packageName}');
  // print('Total packages processed: ${packageList.length}'); // Add this line

  //   }

  @override
  Widget build(BuildContext context) {
 var packageProvider = Provider.of<PackageProvider>(context, listen: false);

    // Convert List<dynamic> to List<Package>
    List<Package> convertedPackages = widget.packages.map((item) {
      return Package(
        packageName: item['name'] ?? 'Default Name',
        packagePrice: item['price'] is int
            ? item['price']
            : int.tryParse(item['price'].toString()) ?? 0,
        mainPage: item['mainPage'] ?? {},
        imagePage: item['imagePage'] ?? {},
        detailsPage: item['detailsPage'] ?? {},
      );
          print('Total packages in WeddingView: ${packageList.length}');

    }).toList();

  if (convertedPackages.isNotEmpty) {
    print('First Package Name: ${convertedPackages[0].packageName}');
  }


        // Access the PackageProvider
    // var packageProvider = Provider.of<PackageProvider>(context);

    // // Retrieve the packages from the provider
    // List<Package> packages = packageProvider.packages;

    // // Now you can use the 'packages' list in your UI
    // // For example, print the first package name and details in the console
    // if (packages.isNotEmpty) {
    //   print('First Package Name in Build: ${packages[0].packageName}');
    //   print('First Package Details in Build: ${packages[0].detailsPage}');
    // }
//  // processPackages();
//   print('Building Widget');
//     if (packageList.isNotEmpty) {
//       print('First Package Name: ${packageList[0].packageName}');
//     }

    //if (widget.packages.isNotEmpty) {
//   for (int i = 0; i < widget.packages.length; i++) {
//     Map<String, dynamic> packageItem = widget.packages[i];
//     print('Package $i: $packageItem');

//     // Access and print data from the mainPage
//     Map<String, dynamic> mainPage = packageItem['mainPage'] ?? {};
//     print('Main Page for Package $i: $mainPage');

//     // Access and print data from the imagePage
//     Map<String, dynamic> imagePage = packageItem['imagePage'] ?? {};
//     List<String> images = imagePage['images'] ?? [];
//     print('Images for Package $i: $images');

//     // Access and print data from the detailsPage
//     Map<String, dynamic> detailsPage = packageItem['detailsPage'] ?? {};
//     String details = detailsPage['details'] ?? '';
//     print('Details for Package $i: $details');

//     String packageName = packageItem['name'] ?? 'Default Name';
//     int packagePrice = packageItem['price'] is int
//         ? packageItem['price']
//         : int.tryParse(packageItem['price'].toString()) ?? 0;

//     // Modify the package name, for example, adding a suffix
//     packageName = '$packageName ';
//     print('Modified Package Name: $packageName');
//     print('Package Price: $packagePrice');
// ['images'] ?? [];
//         print('Images for Inner Package $j: $innerImages');

//         Map<String, dynamic> innerDetailsPage = inn
//     // Check if 'packages' key exists and is a list
//     if (packageItem.containsKey('packages') &&
//         packageItem['packages'] is List) {
//       List<dynamic> innerPackages = packageItem['packages'];
//       for (int j = 0; j < innerPackages.length; j++) {
//         Map<String, dynamic> innerPackage = innerPackages[j];
//         print('Inner Package $j: $innerPackage');

//         // Access and print data from the innerPackage mainPage, imagePage, and detailsPage
//         Map<String, dynamic> innerMainPage = innerPackage['mainPage'] ?? {};
//         print('Main Page for Inner Package $j: $innerMainPage');

//         Map<String, dynamic> innerImagePage = innerPackage['imagePage'] ?? {};
//         List<dynamic> innerImages = innerImagePageerPackage['detailsPage'] ?? {};
//         String innerDetails = innerDetailsPage['details'] ?? '';
//         print('Details for Inner Package $j: $innerDetails');

//         String innerPackageName = innerPackage['name'] ?? 'Default Inner Name';
//         int innerPackagePrice = innerPackage['price'] is int
//             ? innerPackage['price']
//             : int.tryParse(innerPackage['price'].toString()) ?? 0;

//         // Modify the inner package name, for example, adding a suffix
//         innerPackageName = '$innerPackageName ';
//         print('Modified Inner Package Name: $innerPackageName');
//         print('Inner Package Price: $innerPackagePrice');
//       }
//     }
//   }

    // ... other code

    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 50),
                  Stack(
                    children: [
                      Positioned(
                        child: ClayContainer(
                          color: Color.fromARGB(255, 213, 212, 212),
                          height: 200,
                          width: 400,
                          depth: 20,
                          curveType: CurveType.convex,
                          spread: 0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(7),
                        child: ClayContainer(
                          child: Image.asset('images/garden1.png'),
                        ),
                      ),
                      IconButton(
                        padding: const EdgeInsets.only(left: 20, top: 15),
                        onPressed: () {
                          // if (packages.isNotEmpty) {
                          //       for (int i = 0; i < packages.length; i++) {
                          // String usernameFromPackage = packages[i]['name'];
                          //       print('Username from package $i: $usernameFromPackage');
                          //                     }
                          //                             }
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ServicePage(
                                userType: "",
                                usern: "shahd",
                                ema: "shahd@gmail.com",
                              ),
                            ),
                          );
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          size: 25,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        packageList.isNotEmpty
                            ? packageList[0].packageName
                            : "Default Name",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 100,
                      ),
                      IconButton(
                        onPressed: () {
                          print("1");
                        },
                        icon: Icon(
                          Icons.favorite_outline_rounded,
                          size: 25,
                          color: Colors.red,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          print("1");
                        },
                        icon: Icon(
                          Icons.email,
                          size: 25,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        child: Icon(
                          Icons.place,
                          color: Colors.grey,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(right: 20),
                        child: Text(
                          "نابلس - شارع سفيان",
                          style: TextStyle(fontSize: 15, color: Colors.grey),
                        ),
                      ),
                      for (int i = 0; i < 3; i++)
                        Container(
                          child: Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                        ),
                      for (int i = 0; i < 5 - 3; i++)
                        Container(
                          child: Icon(
                            Icons.star_border,
                            color: Colors.yellow,
                          ),
                        ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Divider(
                    color: Colors.grey,
                    height: 20,
                    thickness: 1,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 20),
                    child: Text(
                      "محتوى العرض ",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    ' بشمل العرض عرس فاخر في افخم القاعات  مع توفير جميع الخدمات التي تحتاجها في يوم العمر بسعر مغري جدا يمكنك معرفة التفاصيل اسفل الصفحة  سارع بالحجز معنا',
                    maxLines: maxLinesToShow,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14,
                      color: Color.fromARGB(255, 134, 133, 133),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Divider(
                    color: Colors.grey,
                    height: 20,
                    thickness: 1,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 40),
                    child: Text(
                      " أشهر الأعراس بالمكان",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 140,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisSpacing: 0,
                        crossAxisSpacing: 0,
                      ),
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, i) {
                        List<String> images = [
                          'images/garden2.png',
                          'images/garden1.png',
                          'images/roz.png',
                        ];

                        List<String> texts = [
                          "أحمد ونور",
                          "محمد وأمل",
                          "علي وماسة",
                        ];
                        String imageText = texts[i];

                        String imagePath = images[i];

                        return Stack(
                          children: [
                            ClayContainer(
                              color: Colors.white,
                              height: 140,
                              width: 130,
                              depth: 40,
                              curveType: CurveType.convex,
                              spread: 2,
                              child: Container(
                                margin: EdgeInsets.only(top: 90, left: 10),
                                child: Text(
                                  imageText,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(7),
                              child: ClayContainer(
                                color: Colors.white,
                                height: 75,
                                width: 115,
                                depth: -40,
                                spread: 4,
                                child: Image.asset(imagePath),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 120,
                        margin: EdgeInsets.only(left: 50),
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                          border: Border.all(
                            color: Color(0xFF5BA581),
                            width: 2.0,
                            style: BorderStyle.solid,
                          ),
                        ),
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => YourPage(),
                              ),
                            );
                          },
                          child: Text(
                            "قائمة الخدمات",
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF5BA581),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 130,
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                          border: Border.all(
                            color: Color(0xFF5BA581),
                            width: 2.0,
                            style: BorderStyle.solid,
                          ),
                        ),
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => brandView(),
                              ),
                            );
                          },
                          child: Text(
                            "حديقة التصوير",
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF5BA581),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),


                  Divider(
                    color: Colors.grey,
                    height: 20,
                    thickness: 1,
                  ),
            SizedBox(
                  height: 5,
                ),
                Container(
                    // padding: EdgeInsets.only(top: 50),
                    height: 180,
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: 3,
                        itemBuilder: (context, i) {
                          return Container(
                              margin: EdgeInsets.only(bottom: 10),
                              height: 90,
                              child: Stack(children: [
                                CircleAvatar(
                                  backgroundColor: Colors.grey,
                                  // backgroundImage: AssetImage(""),
                                ),
                                Container(
                                    margin: EdgeInsets.only(right: 120),
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text("${"Zoya Patel"}",
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              )),
                                          Container(
                                              margin: EdgeInsets.only(left: 65),
                                              child: Row(children: [
                                                for (int i = 0; i < 3; i++)
                                                  Container(
                                                      child: Icon(
                                                    Icons.star,
                                                    size: 18,
                                                    color: Colors.yellow,
                                                  )),
                                                //where rating is 3 and total num of star is 5
                                                for (int i = 0; i < 5 - 3; i++)
                                                  Container(
                                                    child: Icon(
                                                      Icons.star_border,
                                                      size: 18,
                                                      color: Colors.yellow,
                                                    ),
                                                  )
                                              ])),
                                          Text("lkdjfielwkft",
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.grey))
                                        ])),
                              ]));
                        })),
                Divider(
                  color: Colors.grey,
                  height: 20,
                  thickness: 1,
                ),

                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Container(
                      width: 200,
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Color(0xFF5BA581),
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                      child: TextButton(
                        onPressed: () {
                          setState(() {});
                        },
                        child: Text(
                          "احجز العرض",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

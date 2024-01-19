// import 'package:flutter/material.dart';
// import 'package:convex_bottom_bar/convex_bottom_bar.dart';

// class ServiceItem {
//   final String name;
//   final String description;
//   final ImageProvider image;
//   final Widget servicePageRoute;

//   ServiceItem({
//     required this.name,
//     required this.description,
//     required this.image,
//     required this.servicePageRoute,
//   });
// }

// class ServicePage extends StatelessWidget {
//   final String userType;
//   final String usern;
//   final String ema;

//   ServicePage({required this.userType, required this.usern, required this.ema});

//   List<ServiceItem> services = [
//     ServiceItem(
//       name: 'الأعراس',
//       description: 'Have a nice wedding',
//       image: AssetImage('images/rings.png'),
//       servicePageRoute: WeddingServicePage(),
//     ),
//     ServiceItem(
//       name: 'التخرج',
//       description: 'Description for Service 2',
//       image: AssetImage('images/graduation.png'),
//       servicePageRoute: GraduateServicePage(),
//     ),
//     ServiceItem(
//       name: 'baby shower',
//       description: 'Description for Service 3',
//       image: AssetImage('images/baby-shower.png'),
//       servicePageRoute: BabyServicePage(),
//     ),
//     ServiceItem(
//       name: 'عيد الميلاد',
//       description: 'Description for Service 3',
//       image: AssetImage('images/happy-birthday.png'),
//       servicePageRoute: BirthdayServicePage(),
//     ),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text(
//           'أختر مناسبتك - ${usern}',
//           style: TextStyle(color: Colors.white),
//         ),
//         backgroundColor: Color(0xFF5BA581),
//       ),
//       endDrawer: Drawer(
//         child: Column(
//           children: [
//             UserAccountsDrawerHeader(
//               accountName: Text(
//                 usern,
//                 style: TextStyle(color: Colors.white),
//               ),
//               accountEmail: Text(
//                 "${usern}@gmail.com",
//                 style: TextStyle(color: Colors.white),
//               ),
//               currentAccountPicture: CircleAvatar(
//                 backgroundImage: AssetImage('images/person2.png'),
//               ),
//               decoration: BoxDecoration(
//                 color: Color.fromARGB(255, 91, 165, 129),
//               ),
//             ),
//             Expanded(
//               child: ListView(
//                 children: [
//                   ListTile(
//                     leading: Icon(Icons.message),
//                     title: Text(
//                       'الرسائل',
//                       style: TextStyle(color: Color.fromARGB(255, 91, 165, 129)),
//                     ),
//                     onTap: () {
//                       // Handle messages action
//                     },
//                   ),
//                   ListTile(
//                     leading: Icon(Icons.logout),
//                     title: Text(
//                       'تسجيل الخروج ',
//                       style: TextStyle(color: Color.fromARGB(255, 91, 165, 129)),
//                     ),
//                     onTap: () {
//                       // Implement logout logic here
//                       Navigator.of(context).pushReplacement(
//                         MaterialPageRoute(builder: (context) => Login1()),
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             WaveBackground(),
//             SizedBox(height: 2),
//             Text(
//               '',
//               style: TextStyle(fontSize: 18),
//             ),
//             SizedBox(height: 2),
//             GridView.builder(
//               shrinkWrap: true,
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 crossAxisSpacing: 25.0,
//                 mainAxisSpacing: 25.0,
//               ),
//               itemCount: services.length,
//               itemBuilder: (context, index) {
//                 return SquareServiceButton(
//                   image: services[index].image,
//                   name: services[index].name,
//                   onTap: () {
//                     Navigator.of(context).push(
//                       MaterialPageRoute(
//                         builder: (context) => services[index].servicePageRoute,
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: ConvexAppBar(
//         style: TabStyle.reactCircle,
//         backgroundColor: Color(0xFF5BA581),
//         items: [
//           TabItem(icon: Icons.home, title: 'الرئيسية'),
//           TabItem(icon: Icons.person, title: 'صفحتك الشخصية'),
//           TabItem(icon: Icons.favorite, title: 'الفضلة'),
//           TabItem(icon: Icons.info, title: ' من نحن'),
//           TabItem(icon: Icons.shopping_cart, title: 'حقيبتي'),
//         ],
//         onTap: (int index) {
//           switch (index) {
//             case 0:
//               Navigator.of(context).push(MaterialPageRoute(builder: (context) => SelectionPage()));
//               break;
//             case 1:
//               Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfilePage()));
//               break;
//             case 2:
//               Navigator.of(context).push(MaterialPageRoute(builder: (context) => FavoritesPage()));
//               break;
//             case 3:
//               Navigator.of(context).push(MaterialPageRoute(builder: (context) => AboutUsPage()));
//               break;
//             case 4:
//               Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyBagPage()));
//               break;
//             default:
//               // Handle other cases if needed
//               break;
//           }
//         },
//       ),
//     );
//   }
// }

// class SquareServiceButton extends StatelessWidget {
//   final ImageProvider image;
//   final String name;
//   final VoidCallback onTap;

//   const SquareServiceButton({
//     required this.image,
//     required this.name,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         width: 80,
//         height: 120,
//         padding: EdgeInsets.all(10),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(30.0),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(0.5),
//               spreadRadius: 2,
//               blurRadius: 4,
//               offset: Offset(0, 3),
//             ),
//           ],
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image(
//               image: image,
//               width: 60,
//               height: 60,
//             ),
//             SizedBox(height: 5),
//             Text(
//               name,
//               style: TextStyle(fontSize: 16),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class WaveBackground extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(); // Your wavy background implementation here
//   }
// }

// class SelectionPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Selection Page'),
//       ),
//       body: Center(
//         child: Text('This is the Selection Page'),
//       ),
//     );
//   }
// }

// class ProfilePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Profile Page'),
//       ),
//       body: Center(
//         child: Text('This is the Profile Page'),
//       ),
//     );
//   }
// }

// class FavoritesPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // Your FavoritesPage implementation here
//     return Container();
//   }
// }

// class AboutUsPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // Your AboutUsPage implementation here
//     return Container();
//   }
// }

// class MyBagPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // Your MyBagPage implementation here
//     return Container();
//   }
// }

// class WeddingServicePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Wedding Service Page'),
//       ),
//       body: Center(
//         child: Text('This is the Wedding Service Page'),
//       ),
//     );
//   }
// }

// class GraduateServicePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Graduate Service Page'),
//       ),
//       body: Center(
//         child: Text('This is the Graduate Service Page'),
//       ),
//     );
//   }
// }

// class BabyServicePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Baby Service Page'),
//       ),
//       body: Center(
//         child: Text('This is the Baby Service Page'),
//       ),
//     );
//   }
// }

// class BirthdayServicePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Birthday Service Page'),
//       ),
//       body: Center(
//         child: Text('This is the Birthday Service Page'),
//       ),
//     );
//   }
// }

// class Login1 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Login1 Page'),
//       ),
//       body: Center(
//         child: Text('This is the Login1 Page'),
//       ),
//     );
//   }
// }



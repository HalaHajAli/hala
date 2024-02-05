import 'package:flutter/material.dart';


class MyAppp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'عرس محمد وأمل',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ImageCollagePage(),
    );
  }
}

class ImageCollagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('عرس محمد وأمل',),
      ),
      body: Center(
        child: Wrap(
          spacing: 5.0,
          runSpacing: 5.0,
          children: [
            ClickableImage(imagePath: 'images/z.png', width: 150.0, height: 200.0),
            ClickableImage(imagePath:'images/zz.png', width: 200.0, height: 150.0),
               ClickableImage(imagePath: 'images/zzzz.png', width: 250.0, height: 250.0),
            ClickableImage(imagePath:'images/zzz.png', width: 180.0, height: 180.0),
         
          ],
        ),
      ),
    );
  }
}

class ClickableImage extends StatelessWidget {
  final String imagePath;
  final double width;
  final double height;

  ClickableImage({
    required this.imagePath,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Open the image in full screen here (you can use Navigator to navigate to a new page)
        // For simplicity, this example just shows a dialog with the image.
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: Container(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
              ),
            ),
          ),
        );
      },
      child: Container(
        width: width,
        height: height,
        margin: EdgeInsets.all(5.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

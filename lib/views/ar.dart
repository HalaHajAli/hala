import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:screenshot/screenshot.dart';
import 'dart:typed_data';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  final firstCamera = cameras.first;

  runApp(MyApp(camera: firstCamera));
}

class MyApp extends StatelessWidget {
  final CameraDescription camera;

  const MyApp({Key? key, required this.camera}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CameraScreen(camera: camera),
    );
  }
}

class CameraScreen extends StatefulWidget {
  final CameraDescription camera;

  const CameraScreen({Key? key, required this.camera}) : super(key: key);

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  ScreenshotController screenshotController = ScreenshotController();

  List<Widget> draggableItems = [];
  bool isDragging = false;
  Offset draggableItemPosition = Offset(100.0, 100.0);

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.medium,
    );

    _initializeControllerFuture = _controller.initialize().then((_) {
      print("CameraController initialization successful");
    }).catchError((error) {
      print("Error initializing CameraController: $error");
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _captureAndSave() async {
    try {
      screenshotController.capture().then((Uint8List? image) {
        if (image != null) {
          // Save the image to the device's gallery or handle it as needed
          // For simplicity, we'll just print the image size in bytes
          print('Image size: ${image.lengthInBytes} bytes');
        }
      });
    } catch (e) {
      print(e);
    }
  }

  void _startDrag(DragStartDetails details) {
    setState(() {
      isDragging = true;
    });
  }

  void _updateDrag(DragUpdateDetails details) {
    setState(() {
      draggableItemPosition += details.delta;
    });
  }

  void _endDrag(DragEndDetails details) {
    setState(() {
      isDragging = false;
    });
  }

  void _addDraggableItem(Widget item) {
    setState(() {
      draggableItems.add(
        Positioned(
          left: 150.0, // Set initial position as needed
          top: 150.0,
          child: YourDraggableItemWidget(child: item),
        ),
      );
    });
  }

  void _addDeflatedImage() {
    Widget deflatedImage = Image.asset('assets/deflated_image.png'); // Replace with your image path
    _addDraggableItem(deflatedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Camera Screen')),
      body: FutureBuilder(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return GestureDetector(
              onPanStart: _startDrag,
              onPanUpdate: _updateDrag,
              onPanEnd: _endDrag,
              child: Screenshot(
                controller: screenshotController,
                child: Stack(
                  children: [
                    CameraPreview(
                      _controller,
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                    if (isDragging)
                      Positioned(
                        left: draggableItemPosition.dx,
                        top: draggableItemPosition.dy,
                        child: YourDraggableItemWidget(),
                      ),
                    ...draggableItems,
                  ],
                ),
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _captureAndSave,
            child: Icon(Icons.camera),
          ),
          SizedBox(height: 16),
          FloatingActionButton(
            onPressed: _addDeflatedImage,
            child: Icon(Icons.add),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class YourDraggableItemWidget extends StatelessWidget {
  final Widget? child;

  YourDraggableItemWidget({this.child});

  @override
  Widget build(BuildContext context) {
    return Draggable(
      child: child ?? Container(), // Use Container() if child is null
      feedback: child ?? Container(),
    );
  }
}

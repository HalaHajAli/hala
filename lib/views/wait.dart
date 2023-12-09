import 'package:flutter/material.dart';

class TabBarPage extends StatefulWidget {
  const TabBarPage({Key? key}) : super(key: key);

  @override
  _TabBarPageState createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  double whiteBoxHeight = 500.0; // Initial height of the white box
  double whiteBoxWidth = 500.0; // Initial width of the white box

  List<Widget> generateContainers(int count) {
    // Generate a list of containers based on count
    List<Widget> containers = [];
    for (int i = 0; i < count; i++) {
      containers.add(
        Container(
          width: double.infinity,
          height: 120,
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 210, 169, 199), // Replace with your desired color
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              (i + 1).toString(),
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      );
    }
    return containers;
  }

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  void expandWhiteBox() {
    setState(() {
      // Increase the height and width of the white box upon tab selection
      whiteBoxHeight = 400.0;
      whiteBoxWidth = 500.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tab bar Without Appbar'),
        backgroundColor: Color(0xFF5BA581),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                SizedBox(height: 50),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Color(0xFF5BA581),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TabBar(
                    unselectedLabelColor: Colors.white,
                    labelColor: Colors.black,
                    indicatorColor: Colors.white,
                    indicatorWeight: 2,
                    indicator: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    controller: tabController,
                    onTap: (index) {
                      expandWhiteBox(); // Call function to expand the white box
                    },
                    tabs: [
                      Tab(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            '           قائمة الانتظار         ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Tab(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            '             قيد التنفيذ          ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10), // Space between tab bar and white box
                AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  height: whiteBoxHeight, // Dynamic height for the white box
                  color: Colors.white,
                  child: SizedBox(
                    width: whiteBoxWidth, // Set the width here
                    child: TabBarView(
                      controller: tabController,
                      children: [
                        ListView(
                          children: generateContainers(3), // Create 3 containers
                        ),
                        ListView(
                          children: generateContainers(3), // Create 3 containers
                        ),
                      ],
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

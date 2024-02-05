import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application/views/EventProvider.dart';
import 'package:flutter_application/views/exc.dart';
import 'package:flutter_application/views/watingList.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application/views/EventProvider.dart';

class TabBarPage extends StatefulWidget {
  const TabBarPage({Key? key}) : super(key: key);

  @override
  _TabBarPageState createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage> with SingleTickerProviderStateMixin {
  late TabController tabController;
  double whiteBoxHeight = 600.0;
  double whiteBoxWidth = 500.0;

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
      whiteBoxHeight = 600.0;
      whiteBoxWidth = 500.0;
    });
  }

  void clearWaitingList(BuildContext context) {
    Provider.of<WaitingListProvider>(context, listen: false).clearWaitingList();
  }

  void clearExecutionList(BuildContext context) {
    Provider.of<ExecutionListProvider>(context, listen: false).clearExecutionList();
  }

  Widget generateContainerForWaitingList(EventRequest request) {
    return Container(
      width: double.infinity,
      height: 210,
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 194, 17, 17),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

            Text(
            'المخطط: ${request.plannername}',
            style: TextStyle(color: Colors.white,
            fontWeight: FontWeight.bold, // Bold text
              fontSize: 18, // Larger font size),
            )),
          Text(
            'اسم العرض: ${request.package}',
            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, // Bold text
              fontSize: 18, // Larger font size),
           ) ),
        
            Text(
            'المستخدم: ${request.username}',
            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, // Bold text
              fontSize: 18, // Larger font size    ),
              )  ),

 Text(
            'لون الزينة: ${request.color}',
            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, // Bold text
              fontSize: 18, // Larger font size)),
    )   ),



          Text(

            'المطعم: ${request.food}',
            style: TextStyle(color: Colors.white ,fontWeight: FontWeight.bold, // Bold text
              fontSize: 18, // Larger font size 
            ),
          ),
          Text(
            'تاريخ: ${request.date}',
            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, // Bold text
              fontSize: 18, // Larger font size
            ),
          ),
          Text(
            'الوقت: ${request.time}',
            style: TextStyle(color: Colors.white ,fontWeight: FontWeight.bold, // Bold text
              fontSize: 18, // Larger font size
            ),
          ),
         
        ],
      ),
    );
  }

  Widget generateContainerForExecutionList(EventRequest request) {
    return Container(
      width: double.infinity,
      height: 210,
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 39, 78, 138),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
            Text(
            'المخطط: ${request.plannername}',
            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, // Bold text
              fontSize: 18, // Larger font size
            ),
          ),
          Text(
            'اسم العرض: ${request.package}',
            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, // Bold text
              fontSize: 18, // Larger font size
            ),
          ),
        
            Text(
            'المستخدم: ${request.username}',
            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, // Bold text
              fontSize: 18, // Larger font size
            ),
          ),

 Text(
            'لون الزينة: ${request.color}',
            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, // Bold text
              fontSize: 18, // Larger font size
            ),
          ),



          Text(

            'المطعم: ${request.food}',
            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, // Bold text
              fontSize: 18, // Larger font size
            ),
          ),
          Text(
            'تاريخ: ${request.date}',
            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, // Bold text
              fontSize: 18, // Larger font size
            ),
          ),
          Text(
            'الوقت: ${request.time}',
            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, // Bold text
              fontSize: 18, // Larger font size)
            )
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'المهام ',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xFF5BA581),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
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
                      expandWhiteBox();
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
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () => clearWaitingList(context),
                      child: Text('مسح قائمة الانتظار'),
                    ),
                    ElevatedButton(
                      onPressed: () => clearExecutionList(context),
                      child: Text('مسح قائمة التنفيذ'),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  height: whiteBoxHeight,
                  color: Colors.white,
                  child: SizedBox(
                    width: whiteBoxWidth,
                    child: TabBarView(
                      controller: tabController,
                      children: [
                        Consumer<WaitingListProvider>(
                          builder: (context, waitingListProvider, child) {
                            List<EventRequest> waitingList =
                                waitingListProvider.getWaitingList;
                            return ListView.builder(
                              itemCount: waitingList.length,
                              itemBuilder: (context, index) {
                                final EventRequest request =
                                    waitingList[index];
                                return generateContainerForWaitingList(request);
                              },
                            );
                          },
                        ),
                        Consumer<ExecutionListProvider>(
                          builder: (context, executionListProvider, child) {
                            List<EventRequest> executionList =
                                executionListProvider.getExecutionList;
                            return ListView.builder(
                              itemCount: executionList.length,
                              itemBuilder: (context, index) {
                                final EventRequest request =
                                    executionList[index];
                                return generateContainerForExecutionList(request);
                              },
                            );
                          },
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

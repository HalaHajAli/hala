import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application/views/gradProvider.dart';

class GradListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GradProvider gradProvider = Provider.of<GradProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Grad List'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              gradProvider.addToGradList('New Request Item');
              // Rebuild the widget tree to reflect the changes
              // Note: Since this is a StatelessWidget, it won't rebuild itself with setState.
              // If GradListPage is part of a StatefulWidget, you can use setState in the parent widget.
              // If GradListPage is intended to be a StatefulWidget, you should change it accordingly.
            },
            child: Text('Add Request'),
          ),
          ElevatedButton(
            onPressed: () {
              // Print the GradProvider values
              print(gradProvider.getGradList());
            },
            child: Text('Print Grad List'),
          ),
          // Display the GradProvider values
          Text('Grad List: ${gradProvider.getGradList().toString()}'),
        ],
      ),
    );
  }
}

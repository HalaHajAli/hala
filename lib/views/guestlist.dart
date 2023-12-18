import 'package:flutter/material.dart';

class Guest {
  String name;
  bool attended;

  Guest(this.name, {this.attended = false});
}

class GuestListPage extends StatefulWidget {
  @override
  _GuestListPageState createState() => _GuestListPageState();
}

class _GuestListPageState extends State<GuestListPage> {
  List<Guest> guestList = [];
  TextEditingController guestNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('قائمة الحضور', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF5BA581),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Color(0xFF5BA581)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: guestNameController,
                      decoration: InputDecoration(
                        labelText: 'الإسم',
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {
                      addGuest();
                    },
                    style: ElevatedButton.styleFrom(
                   primary: Color(0xFF5BA581), // Set the background color to green
                        ),
                     child: Text(
                        'أضف للقائمة',
                           style: TextStyle(color: Colors.white), // Set the text color to white
               ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Text(
                'القائمة:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: guestList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(guestList[index].name),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Checkbox(
                            value: guestList[index].attended,
                            onChanged: (value) {
                              markAttendance(index, value ?? false);
                            },
                            activeColor: Color(0xFF5BA581),
                          ),
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              showDeleteDialog(index);
                            },
                          ),
                        ],
                      ),
                      onTap: () {
                        editGuestName(index);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void addGuest() {
    String guestName = guestNameController.text.trim();
    if (guestName.isNotEmpty) {
      setState(() {
        guestList.add(Guest(guestName));
        guestNameController.clear();
      });
    }
  }

  void editGuestName(int index) async {
    String editedName = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('تعديل'),
          content: TextField(
            controller: TextEditingController(text: guestList[index].name),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog without saving
              },
              child: Text('إلغاء'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(guestNameController.text.trim());
              },
              child: Text('حفظ'),
            ),
          ],
        );
      },
    );

    if (editedName != null && editedName.isNotEmpty) {
      setState(() {
        guestList[index].name = editedName;
      });
    }
  }

  void markAttendance(int index, bool value) {
    setState(() {
      guestList[index].attended = value;
    });
  }

  void showDeleteDialog(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('حذف'),
          content: Text('هل أنت متأكد من أمك تريد حذذف ${guestList[index].name}?من القائمة'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog without deleting
              },
              child: Text('إلغاء'),
            ),
            TextButton(
              onPressed: () {
                deleteGuest(index);
                Navigator.of(context).pop(); // Close the dialog after deleting
              },
              child: Text('حذف'),
            ),
          ],
        );
      },
    );
  }

  void deleteGuest(int index) {
    setState(() {
      guestList.removeAt(index);
    });
  }
}

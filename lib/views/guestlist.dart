import 'package:flutter/material.dart';
import 'package:flutter_application/views/ReqProvider.dart';
import 'package:flutter_application/views/GradProvider.dart';

import 'package:provider/provider.dart';
import 'review.dart'; // Import the next page file

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
  TextEditingController maxGuestController = TextEditingController();
  int maxGuests = 0; // Default maximum number of guests

  // Define a list of different colors for the cards
  List<Color> cardColors = [
    Color.fromARGB(255, 164, 124, 129),

  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('قائمة الحضور', style: TextStyle(fontFamily: 'Arabic', color: Colors.white,fontWeight: FontWeight.bold)),
        backgroundColor: Color(0xFF5BA581),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        color: Colors.white, // Set the background color to white
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: maxGuestController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'العدد الأقصى للضيوف',
                    ),
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: setMaxGuests,
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF5BA581),
                  ),
                  child: Text(
                    'تعيين',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'العدد الأقصى للضيوف: $maxGuests',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Arabic'),
            ),
            SizedBox(height: 16),
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
                  onPressed: addGuest,
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF5BA581),
                  ),
                  child: Text(
                    'أضف للقائمة',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'القائمة:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Arabic',),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: guestList.length,
                itemBuilder: (context, index) {
                  // Use modulo to cycle through the list of colors
                  Color cardColor = cardColors[index % cardColors.length];

                  return Card(
                    elevation: 3,
                    margin: EdgeInsets.symmetric(vertical: 8),
                    color: cardColor,
                    child: ListTile(
                      title: Text(guestList[index].name, style: TextStyle(fontFamily: 'Arabic')),
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
                            icon: Icon(Icons.delete, color: Colors.white),
                            onPressed: () {
                              showDeleteDialog(index);
                            },
                          ),
                        ],
                      ),
                      onTap: () {
                        editGuestName(index);
                      },
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Navigate to the next page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => review()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF5BA581),
                padding: EdgeInsets.all(16),
              ),
              child: Text(
                'الصفحة التالية',
                style: TextStyle(color: Colors.white, fontFamily: 'Arabic', fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void setMaxGuests() {
    int enteredMaxGuests = int.tryParse(maxGuestController.text) ?? maxGuests;

    if (enteredMaxGuests > 400) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('تنبيه'),
            content: Text('يمكنك فقط إضافة حتى 400 ضيف. الرجاء تحديد عدد أقل.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: Text('موافق'),
              ),
            ],
          );
        },
      );
    } else {
      setState(() {
        maxGuests = enteredMaxGuests;
      });
    }
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
          content: Text('هل أنت متأكد من أنك تريد حذف ${guestList[index].name} من القائمة؟'),
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

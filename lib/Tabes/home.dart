import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'settings.dart';
import 'task.dart';
import '../core/add_task_bottom_sheet.dart';

class homescreen extends StatefulWidget {
  homescreen({super.key});

  static const String routeName = "home";

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,

      // backgroundColor: Color(0xffDFECDB),
      appBar: AppBar(
        title: Text("TO DO", style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xff6750a4),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return AddTaskBottomSheet();
            },
          );
        },
        child: Icon(CupertinoIcons.add, color: Colors.white),
        backgroundColor:Color(0xff6750a4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: BorderSide(color: Colors.white, width: 3),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 8,
        height: 64,
        shape: CircularNotchedRectangle(),
        padding: EdgeInsets.zero,
        child: BottomNavigationBar(
          currentIndex: index,
          onTap: (value) {
            index = value;
            setState(() {});
          },
          backgroundColor: Colors.transparent,
          elevation: 0,
          // unselectedItemColor: Colors.white,
          showUnselectedLabels: false,
          selectedItemColor: Color(0xff6750a4),
          showSelectedLabels: false,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.list_rounded, size: 30),
              label: "list",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings, size: 30),
              label: "settings",
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
         color: Color(0xff2B125A)
        ),
        child: tabes[index],
      ),
    );
  }

  List<Widget> tabes = [tasks(), settings()];
}

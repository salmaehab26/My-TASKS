import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todoapplication/Task.dart';
import 'package:todoapplication/core/TaskData.dart';
import 'package:todoapplication/firebaseFunctions.dart';

class tasks extends StatefulWidget {
   tasks({super.key});

  @override
  State<tasks> createState() => _tasksState();
}
class _tasksState extends State<tasks> {
  final String? userId = FirebaseAuth.instance.currentUser?.uid;
  var notesList=[];
  var selectedDate =DateTime.now();

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        CalendarTimeline(
          initialDate: DateTime.now(),
          firstDate: DateTime.now().subtract(Duration(days: 365)),
          lastDate: DateTime.now().add(Duration(days: 365)),
          onDateSelected: (date) {
          },
          leftMargin: 20,
          monthColor: Colors.white,
          dayColor: Colors.white,
          activeDayColor: Colors.white,
          activeBackgroundDayColor: Color(0xff6750a4),
          selectableDayPredicate: (date) => true,
          locale: 'en_ISO',
        ),
       TaskData(),
      ],
    );
  }


// Future<void> addNote(Task note,) async {
//
//     await FirebaseFunctions.addTaskToFireStore(note, userId!);
//
//     getAllNotes();
//   }
}


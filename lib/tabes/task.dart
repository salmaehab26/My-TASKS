import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do/firebase_functions.dart';
import 'package:to_do/taskmodel.dart';

import '../task_item.dart';

class tasks extends StatefulWidget {
   tasks({super.key});

  @override
  State<tasks> createState() => _tasksState();
}
class _tasksState extends State<tasks> {

var selectedDate =DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DatePicker(
          DateTime.now(),
          initialSelectedDate:selectedDate,
          selectionColor: Colors.blueAccent,
          selectedTextColor: Colors.white,
          height: 100,
          onDateChange: (date) {
            selectedDate=date;
            setState(() {

            });
          },
        ),
        SizedBox(
          height: 20,
        ),
        Expanded(
            child: StreamBuilder(
          stream: Firebasefunctions.getTasks(selectedDate),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Column(
                children: [
                  Text("something went wrong"),
                  ElevatedButton(onPressed: () {}, child: Text("try again"))
                ],
              );
            }
            List<TaskModel> tasklist =
                snapshot.data?.docs.map((e) => e.data()).toList() ?? [];
            if (tasklist.isEmpty) {
              return Center(child: Text("No Tasks"));
            }
            return ListView.separated(
                itemBuilder: (context, index) {
                  return taskItem(taskModel: tasklist[index]);
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 12,
                  );
                },
                itemCount: tasklist.length);
          },
        ))
      ],
    );
  }
}

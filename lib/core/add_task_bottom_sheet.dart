import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapplication/firebaseFunctions.dart';

import '../Task.dart';

class AddTaskBottomSheet extends StatefulWidget {
  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  DateTime selectedDate = DateTime.now();
  var formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';
  final String? userId = FirebaseAuth.instance.currentUser?.uid;

  // late ListProvider listProvider;

  @override
  Widget build(BuildContext context) {
    // listProvider = Provider.of<ListProvider>(context);
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        children: [
          Text(
            'Add new Task',
            // style: Theme.of(context).textTheme.titleMedium,
          ),
          Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onChanged: (text) {
                      title = text;
                    },
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Please enter task title';
                      }
                      return null;
                    },
                    decoration: InputDecoration(hintText: 'Enter Task Title'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onChanged: (text) {
                      description = text;
                    },
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Please enter task description';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter Task Description',
                    ),
                    maxLines: 4,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Select Date',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                InkWell(
                  onTap: () {
                    showCalendar();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '${selectedDate.day}/${selectedDate.month}/'
                      '${selectedDate.year}',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    addTask();
                  },
                  child: Text(
                    'Add',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void showCalendar() async {
    var chosenDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (chosenDate != null) {
      selectedDate = chosenDate;
      setState(() {});
    }
  }

  void addTask()async {
    if (formKey.currentState?.validate() == true) {
      /// add task to firebase
      Task task = Task(
        title: title,
        description: description,
        dateTime: selectedDate,
      );
      try {
        await FirebaseFunctions.addTaskToFireStore(task,userId!);
        print('Task added successfully');
        Navigator.pop(context);
        setState(() {

        });
      } catch (e) {
        print('Error adding task: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to add task: $e')),
        );
      }
    }
  }
}

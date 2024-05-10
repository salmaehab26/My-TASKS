import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do/firebase_functions.dart';
import 'package:to_do/taskmodel.dart';

class add_tasksheet extends StatefulWidget {
  add_tasksheet({super.key});

  @override
  State<add_tasksheet> createState() => _add_tasksheetState();
}

class _add_tasksheetState extends State<add_tasksheet> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  var selectedDate = DateTime.now();
  var descriptioncontroller = TextEditingController();
  var titlecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Add New task",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 16,
            ),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Enter Task Title";
                }
                return null;
              },
              controller: titlecontroller,
              decoration: InputDecoration(
                  label: Text("Title"),
                  errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(12)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.circular(12))),
            ),
            SizedBox(
              height: 16,
            ),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Enter Task description";
                }
                return null;
              },
              controller: descriptioncontroller,
              decoration: InputDecoration(
                  label: Text("Description"),
                  errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(12)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.circular(12))),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Select Time",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            InkWell(
              onTap: () {
                selectDate(context);
              },
              child: Text(
                "${selectedDate.toString().split(" ").first}",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      TaskModel task = TaskModel(
                          title: titlecontroller.text,
                          date: DateUtils.dateOnly(selectedDate).microsecondsSinceEpoch,
                          description: descriptioncontroller.text);
                      Firebasefunctions.addTask(task).then((value) => Navigator.pop(context));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  child: Text(
                    "Add Task",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w300),
                  )),
            )
          ],
        ),
      ),
    );
  }

  selectDate(BuildContext context) async {
    DateTime? chosenDate = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));

    if (chosenDate != null) {
      selectedDate = chosenDate;
      setState(() {});
    }
  }
}

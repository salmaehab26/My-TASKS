import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapplication/core/task_item.dart';

import '../firebaseFunctions.dart';

class TaskData extends StatelessWidget {
  const TaskData({super.key});

  @override
  Widget build(BuildContext context) {
    final String? userId = FirebaseAuth.instance.currentUser?.uid;

    return Expanded(
      child: StreamBuilder(
        stream:  FirebaseFunctions.getNotes(userId!).asyncMap((notesList) {
        return  notesList ;


        },),
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Column(
              children: [
                Center(child: Text("something went wrong",style: TextStyle(color: Colors.white),)),

              ],
            );
          }
          print("---------------------------");
          // print(snapshot.data?);
          var notesList = snapshot.data??[] ;



          if (notesList.isEmpty) {
            return Center(child: Text("No Watch List Movies",style: TextStyle(
              color: Colors.white,
            ),));
          }
          return ListView.builder(itemBuilder: (context, index) =>taskItem(
            task: notesList,
          ),itemCount: notesList.length,);
        },
      ),
    );
  }

}
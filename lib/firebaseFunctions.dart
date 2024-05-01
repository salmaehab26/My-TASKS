import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapplication/Tabes/home.dart';
import 'package:todoapplication/user.dart';

import 'Task.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseFunctions{
 static CollectionReference<Task> getTasksCollection(String uId) {
    return FirebaseFirestore.instance
        .collection("Users")
        .doc(uId)
        .collection("Notes")
        .withConverter<Task>(
      fromFirestore: (snapshot, _) => Task.fromjson(snapshot.data()!),
      toFirestore: (task, _) => task.tojson(),
    );
  }
  // static CollectionReference<Task> getTasksCollection( String uId)) {
  // return  FirebaseFirestore.instance.collection(Task.collectionName)
  //       .withConverter<Task>(
  //       fromFirestore: (snapshot, options) =>
  //           Task.fromjson(snapshot.data()!),
  //       toFirestore: (task, options) => task.tojson());
  // }

  static Future<void> addTaskToFireStore(Task task, String uId) {
    var taskCollection = getTasksCollection(uId);// collection
   var docRef = taskCollection.doc();// document
    task.id = docRef.id;
    return docRef.set(task);
  }

  static CollectionReference<MyUser> getUsersCollection() {
    return FirebaseFirestore.instance
        .collection(MyUser.collectionName)
        .withConverter<MyUser>(
        fromFirestore: (snapshot, options) =>
            MyUser.fromFireStore(snapshot.data()),
        toFirestore: (user, options) => user.toFireStore());
  }
  static Future<MyUser?> readUserFromFireStore(String uId) async {
    var querySnapShot = await getUsersCollection().doc(uId).get();
    return querySnapShot.data();
  }

 static Stream<List<Task>> getNotes(String uId) {
    return getTasksCollection(uId).snapshots().map((querySnapshot) =>
        querySnapshot.docs.map((doc) => doc.data()).toList());
  }
  //
   Stream<QuerySnapshot<Map<String, dynamic>>> getAllNotes() {
    return FirebaseFirestore.instance.collectionGroup("Notes").snapshots();
  }

  Future<void> updateNote(Task note, String uId) async {
    final docRef = getTasksCollection(uId).doc(note.id);
    await docRef.update(note.tojson());
  }

  Future<void> deleteNote(String id, String uId) {
    return getTasksCollection(uId).doc(id).delete();
  }


}
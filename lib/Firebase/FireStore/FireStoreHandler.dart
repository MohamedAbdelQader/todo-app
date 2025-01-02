import 'dart:ffi';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'model/Task_Model.dart';
import 'model/User-Model.dart';

class FirestoreHandler {
  static CollectionReference<User> getUserCollection() {
    var fireStore = FirebaseFirestore.instance;
    return fireStore.collection(User.collection).withConverter<User>(
      fromFirestore: (snapshot, options) => User.fromFirestore(snapshot, options),
      toFirestore: (value, options) => value.toFireStore(),
    );
  }

  static Future<void> createUser(User user) {
    var collection = getUserCollection();
    var docRef = collection.doc(user.id);
    return docRef.set(user);
  }

  static Future<User?> ReadUser(String userId) async {
    var collection = getUserCollection();
    var docRef = collection.doc(userId);
    var documentSnapshot = await docRef.get();
    return documentSnapshot.data();
  }

  static CollectionReference<TaskModel> getTaskCollection(String userId) {
    return getUserCollection().doc(userId).collection(TaskModel.collectionName).withConverter<TaskModel>(
      fromFirestore: (snapshot, options) => TaskModel.fromFireStore(snapshot.data()),
      toFirestore: (value, options) => value.toFireStore(),
    );
  }

  static Future<void> createTask(TaskModel task, String userId) async {
    var collection = getTaskCollection(userId);
    var docRef = collection.doc();
    task.id = docRef.id;
    await docRef.set(task);
  }
  static Future<List<TaskModel>> GetTasks(String userId)async{
     var collection =getTaskCollection(userId);
    var tasksQuerySnapshot= await collection.get();
    var listTasksSnapshot=tasksQuerySnapshot.docs;
    var tasksList=listTasksSnapshot.map((snapshot)=>snapshot.data()).toList();
    return tasksList;

  }
  static Future<void> DeleteTask(String userId,String taskId){
    var collection =getTaskCollection(userId);
   return collection.doc(taskId).delete();
  }
  static Stream<List<TaskModel>> GetTasksListen(String userId,DateTime selectedDate)async*{
    DateTime dayonly=selectedDate.copyWith(
      hour: 0,
      minute: 0,
      second: 0,
      microsecond: 0,
      millisecond: 0,
    );
    print(dayonly.toString());
    var collection =getTaskCollection(userId).where(
        "date",isEqualTo: Timestamp.fromDate(dayonly));
    var tasksQuerySnapshot=  collection.snapshots();
    var listTasksStream=tasksQuerySnapshot.map((querySnapshot)=>querySnapshot.docs.map(
        (document)=>document.data()
    ).toList());

    yield* listTasksStream;

  }
}

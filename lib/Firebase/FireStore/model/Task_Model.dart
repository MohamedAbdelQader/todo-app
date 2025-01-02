import 'package:cloud_firestore/cloud_firestore.dart';

class TaskModel {
  static const String collectionName = "Tasks";

  String? id;
  String? title;
  String? description;
  Timestamp? date;
  bool isDone;

  TaskModel({
    this.id,
    this.title,
    this.description,
    this.date,
    this.isDone = false,
  });

  // Deserialize from Firestore
  TaskModel.fromFireStore(Map<String, dynamic>? data)
      : id = data?['id'],
        title = data?['title'],
        description = data?['description'],
        date = data?['date'],
        isDone = data?['isDone'] ?? false;


  // Serialize to Firestore
  Map<String, Object?> toFireStore() {
    return {
      if (id != null) "id": id,
      if (title != null) "title": title,
      if (description != null) "description": description,
      if (date != null) "date": date,
      "isDone": isDone,
    };
  }
}

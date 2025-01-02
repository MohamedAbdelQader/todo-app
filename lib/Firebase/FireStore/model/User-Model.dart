import 'package:cloud_firestore/cloud_firestore.dart';

class User{
  static const String collection ="User";
  String? id;
  String? fullName;
  String? age;
  String? phone;
  String? email;
  User({this.id,this.fullName,this.age,this.phone,this.email});
  // mobile app -> FireStore
  Map<String,dynamic> toFireStore(){
  return{
    if (fullName != null) "fullName":fullName,
    if (id != null)"id":id,
    if (email != null)"email":email,
    if (age != null)"age":age,
    if (phone != null)"phone":phone,
  };
  }
  // firestore-> mobile app
  factory User.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,){
    final data = snapshot.data();
    return User(
    id:data?["id"],
    fullName:data?["fullName"],
    email:data?["email"],
    age:data?["age"],
    phone:data?["phone"],
    );
  }
}
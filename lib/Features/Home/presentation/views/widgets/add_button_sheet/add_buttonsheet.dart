import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/Firebase/FireStore/FireStoreHandler.dart';
import 'package:todo_app/Firebase/FireStore/model/Task_Model.dart';
import 'package:todo_app/core/themes/styles/styles_app.dart';

class  AddButtonsheet extends StatefulWidget {
  const AddButtonsheet({super.key});

  @override
  State<AddButtonsheet> createState() => _AddButtonsheetState();

  static void show(BuildContext context){
    showModalBottomSheet(context: context,
        isScrollControlled: true,
        builder: (context)=>Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: const AddButtonsheet(),
    ));

  }
}

class _AddButtonsheetState extends State<AddButtonsheet> {
  late TextEditingController titleController;
  late TextEditingController descriptionController;
  GlobalKey<FormState> formkey=GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    titleController=TextEditingController();
    descriptionController=TextEditingController();
  }

  @override
  void dispose(){
    super.dispose();
    titleController.dispose();

  }

  DateTime? selectedDate;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(
        top: 16,
        left: 16,
        right: 16,
          bottom: MediaQuery.of(context).viewInsets.bottom
      ),
      child: Form(
        key: formkey,
        child:Column(
          mainAxisSize: MainAxisSize.min,
       crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("Add New Task",
            textAlign: TextAlign.center,
            style: StylesApp.bottomSheetTitle,),
          SizedBox(height: 12,),
          TextFormField(
            controller:titleController ,
            validator:(value){
              if(value==null || value.isEmpty){
                return "please enter the title of task";
              }
            },
            decoration: InputDecoration(
              hintText: "Enter Task Title",
            ),

          ),
          SizedBox(height: 12,),
          TextFormField(
            controller: descriptionController,
            validator: (value){
              if(value==null||value.isEmpty){
                return " please enter description of Task";
              }
            },
            decoration: InputDecoration(
                hintText: "Enter Task Description"
            ),
          ),
          SizedBox(height: 12,),
          InkWell(
              onTap: (){
                showMyDatePicker();
              },
              child: Center(
                  child: Text(selectedDate==null?
                  "Date":
                  DateFormat.yMd().format(selectedDate!),
                    style:StylesApp.dateStyle,))),
          ElevatedButton(
              onPressed: (){
                AddNewTask();
              },
              child: const Text("Add"))
        ],
      ), ),
    );
  }

  void showMyDatePicker()async{

    selectedDate= await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 356)))??selectedDate;
        setState(() {

        });
  }

  void AddNewTask() async {
    if (formkey.currentState?.validate() == true) {
      if (selectedDate == null) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Error"),
            content: Text("Please select a date for the task."),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("OK"),
              ),
            ],
          ),
        );
        return;
      }

      try {
        String userId = FirebaseAuth.instance.currentUser!.uid;

        TaskModel newTask = TaskModel(
          title: titleController.text,
          description: descriptionController.text,
          date: Timestamp.fromDate(selectedDate!),
        );

        print("Description: ${newTask.description}");
        print("User ID: $userId");

        await FirestoreHandler.createTask(newTask, userId);
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Task added successfully!")),
        );

        titleController.clear();
        descriptionController.clear();
        selectedDate = null;
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to add task: $e")),
        );
      }
    }
  }

}


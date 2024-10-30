import 'package:flutter/material.dart';
import 'package:todo_app/core/themes/styles/styles_app.dart';

class AddButtonsheet extends StatelessWidget {
  const AddButtonsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      height: MediaQuery.of(context).size.height*.4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("Add New Task",
          textAlign: TextAlign.center,
          style: StylesApp.bottomSheetTitle,),
          TextField(
            decoration: InputDecoration(
              hintText: "Enter Task Title"
            ),
          ),
          TextField(
            decoration: InputDecoration(
                hintText: "Enter Task Description"
            ),
          ),
          Text("Select Date ",  style: StylesApp.bottomSheetTitle.copyWith(fontSize: 16)),
          Text("31/9/2024",  style:StylesApp.dateStyle,),
          Spacer(),
          ElevatedButton(
              onPressed: (){},
              child: const Text("Add"))
        ],
      ),
    );
  }
  static void show(BuildContext context){
    showModalBottomSheet(context: context,
        isScrollControlled: true,
        builder: (context)=>Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: const AddButtonsheet(),
    ));

  }
}

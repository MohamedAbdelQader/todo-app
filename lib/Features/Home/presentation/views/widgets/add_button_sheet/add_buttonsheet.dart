import 'package:flutter/material.dart';
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
  DateTime selectedDate=DateTime.now();
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
          SizedBox(height: 12,),
          TextField(
            decoration: InputDecoration(
              hintText: "Enter Task Title"
            ),
          ),
          SizedBox(height: 12,),
          TextField(
            decoration: InputDecoration(
                hintText: "Enter Task Description"
            ),
          ),
          SizedBox(height: 12,),
          Text("Select Date ",  style: StylesApp.bottomSheetTitle.copyWith(fontSize: 16)),
          SizedBox(height: 12,),
          InkWell(
            onTap: (){
              showMyDatePicker();
            },
              child: Center(child: Text("${selectedDate.day}/${selectedDate.month}/${selectedDate.year}",  style:StylesApp.dateStyle,))),
          Spacer(),
          ElevatedButton(
              onPressed: (){},
              child: const Text("Add"))
        ],
      ),
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
}

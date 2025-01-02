import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/Firebase/FireStore/FireStoreHandler.dart';
import 'package:todo_app/Firebase/FireStore/model/Task_Model.dart';
import 'package:todo_app/core/constants/constants.dart';

import '../../../../../core/Shared Widgets/custom_dialog_message.dart';
import '../../../../../core/Shared Widgets/custom_loading_dialog.dart';

class Taskitem extends StatefulWidget {
  final TaskModel task;
  const Taskitem({super.key, required this.task});

  @override
  State<Taskitem> createState() => _TaskitemState();
}

class _TaskitemState extends State<Taskitem> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Slidable(
        startActionPane: ActionPane(
            motion: BehindMotion(),
            extentRatio: 0.2,
            children: [
              SlidableAction(
                onPressed: (context){
                  deleteTask();

                  setState(() {

                  });

                },
                backgroundColor: Colors.redAccent,
                label: "Delete",
                icon: Icons.delete,
                borderRadius: BorderRadius.only(
                  topLeft:  Radius.circular(10),
                  bottomLeft:  Radius.circular(10),
                ),
              )
            ]),
        child:
        Container(
          height: height*0.1,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start, // Align items to the left
            crossAxisAlignment: CrossAxisAlignment.center, // Align vertically centered
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 3,
                    height: height * 0.08,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Expanded( // Ensures the text occupies remaining space
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.task.title ?? "",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontSize: 20,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      Text(
                        widget.task.description ?? "",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.symmetric(horizontal: 10),
                  child:  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero, // Remove padding
                      minimumSize: Size(60 , 40), // Set minimum width and height
                      shape: RoundedRectangleBorder( // Optional: Adjust button shape
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Icon(Icons.check, size: 20), // Adjust icon size if needed
                  )

              )
            ],
          ),
        ),


    ) ;


  }

  deleteTask(){
showDialog(context: context, builder: (context)=>CustomDialogMessage(
  message: 'Are you sure you want to delete this task ?',
  poitiveBtnTitle:"yes" ,
  poitiveBtnPress: ()async{
    showDialog(context: context, builder: (context)=>CustomLoadingDialog());

    await FirestoreHandler.DeleteTask(
        FirebaseAuth.instance.currentUser!.uid,
        widget.task.id??""
    );
    Navigator.pop(context);
    Navigator.pop(context);

    showToast("Task deleted successfully");
  },
  negativeBtnPress: (){
    Navigator.pop(context);
  },
  negativeBtnTitle: "No",
));

  }
}

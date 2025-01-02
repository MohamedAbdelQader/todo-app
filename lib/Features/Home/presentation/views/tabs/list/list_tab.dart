import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/Features/Home/presentation/views/tabs/list/models/task_dm.dart';
import 'package:todo_app/Features/Home/presentation/views/tabs/list/todo.dart';
import 'package:todo_app/Features/Home/presentation/views/widgets/taskItem.dart';
import 'package:todo_app/Firebase/FireStore/FireStoreHandler.dart';
import 'package:todo_app/Firebase/FireStore/model/Task_Model.dart';
import 'package:todo_app/core/constants/datetime_extensions.dart';
import 'package:todo_app/core/themes/styles/styles_app.dart';

import '../../../../../../core/themes/color/color_app.dart';

class ListTab extends StatelessWidget {
  DateTime selectedDate;
  ListTab(this.selectedDate);

  @override
  Widget build(BuildContext context) {


    return StreamBuilder(
        stream: FirestoreHandler.GetTasksListen(FirebaseAuth.instance.currentUser!.uid,selectedDate),
        builder: (context,snapshot) {
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }
          if(snapshot.hasError){
            return Column(
              spacing: 10,
              children: [
                Text(snapshot.error.toString()),
                ElevatedButton(onPressed: (){},
                    child: Text("Try Again"))
              ],
            );
          }
          List<TaskModel> tasks=snapshot.data??[];
          return
              Padding(
                  padding: const EdgeInsets.all(16),
                child:ListView.separated(
                  separatorBuilder: (context,index)=>SizedBox(height: 20,),
                    itemCount: tasks.length,

                    itemBuilder:(context,index)=>Taskitem(task: tasks[index]))
                ,
              );

        }
    );
  }
}



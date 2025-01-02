import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/Features/Home/presentation/views/tabs/list/models/task_dm.dart';

class Todo extends StatelessWidget {
  final ToDoDM item;
  const Todo({super.key ,required this.item});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         buildDivider(context)
      ],
    );
  }

  Widget buildDivider(context) {
    return Container(
      height: 62,
        width: 4,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(10),bottom: Radius.circular(10))
      ),
    );
  }
}

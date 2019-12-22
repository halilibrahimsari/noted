import 'package:flutter/material.dart';
import 'package:noted/database/appdb.dart';

class CustomDismissibleItem extends StatelessWidget {
  CustomDismissibleItem(
      {this.task, this.onTap,this.onDismissed, Key key})
      : super(key: key);
  final Function onTap;
  final Function onDismissed;
  final Task task;

  @override
  Widget build(BuildContext context) {

    return Dismissible(
      onDismissed: onDismissed,
      key: key,
      child: ListTile(
        onTap: onTap,
        title: Text(task.title),
        subtitle: Text(task.expDate?.toString() ?? "No Date"),
        trailing: Checkbox(
          value: task.isComplete,
          onChanged: null
        ),
      ),
      background: Container(color: Colors.red),
    );
  }

}






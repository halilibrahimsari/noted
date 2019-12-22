import 'package:flutter/material.dart';
import 'package:moor/moor.dart' as moor;
import 'package:noted/database/appdb.dart';
import 'package:noted/database/daos/task_dao.dart';
import 'package:provider/provider.dart';

class NewTaskInput extends StatefulWidget {
  @override
  _NewTaskInputState createState() => _NewTaskInputState();
}

class _NewTaskInputState extends State<NewTaskInput> {
  DateTime expDate;
  TextEditingController ctitle;

  TaskDao get db => Provider.of<TaskDao>(context);

  @override
  void initState() {
    ctitle = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: TextField(
                controller: ctitle,
                decoration: InputDecoration(
                    hintText: "Task Name",
                    prefixIcon: IconButton(
                      icon: Icon(Icons.calendar_today),
                      onPressed: () async {
                        expDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2010),
                          lastDate: DateTime(2050),
                        );
                      },
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.send),
                      onPressed: () => insertTask(),
                    )),
                onSubmitted: (context) => insertTask(),
              ),
            ),
          ],
        ),
      ],
    );
  }

  void insertTask() {
    if (ctitle.text.isNotEmpty) {
      final task = TasksCompanion(
        title: moor.Value(ctitle.text),
        expDate: moor.Value(expDate),
      );
      db.insertTask(task);

      ctitle.clear();
      expDate = null;
    }
  }
}

import 'package:flutter/material.dart';
import 'package:moor/moor.dart' as moor;
import 'package:noted/database/appdb.dart';
import 'package:provider/provider.dart'; 

class NewTaskInput extends StatefulWidget {
  @override
  _NewTaskInputState createState() => _NewTaskInputState();
}

class _NewTaskInputState extends State<NewTaskInput> {
  DateTime expDate;
  TextEditingController ctitle;
  TextEditingController cdesc;

  @override
  void initState() {
    ctitle = TextEditingController();
    cdesc = TextEditingController();
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
                ),
                onSubmitted: (context) => insertTask(),
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: TextField(
                controller: cdesc,
                decoration: InputDecoration(hintText: "Task Name"),
                onSubmitted: (context) => insertTask(),
              ),
            ),
            IconButton(
              icon: Icon(Icons.send),
              onPressed: () => insertTask(),
            )
          ],
        ),
      ],
    );
  }

  void insertTask() {
    if (ctitle.text.isNotEmpty) {
      final database = Provider.of<TaskDao>(context);
      final task = TasksCompanion(
        title: moor.Value(ctitle.text),
        desc: moor.Value(cdesc.text),
        expDate: moor.Value(expDate),
      );
      database.insertTask(task);

      ctitle.clear();
      cdesc.clear();
      expDate = null;
    }
  }
}

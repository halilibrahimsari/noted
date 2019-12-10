import 'package:flutter/material.dart';
import 'package:noted/ui/new_task_page.dart';
import 'package:noted/ui/widgets/new_task_input.dart';
import 'package:provider/provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../data/moor_database.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showCompleted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Duly Noted"),
        leading: IconButton(
          icon: Icon(Icons.settings),
          onPressed: () {},
        ),
        elevation: 5,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: _buildTaskList(context),
          ),
          NewTaskInput(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => NewTaskPage()));
        },
      ),
    );
  }
}

StreamBuilder<List<Task>> _buildTaskList(BuildContext context) {
  final dao = Provider.of<TaskDao>(context);
  return StreamBuilder(
    stream: dao.watchUncompletedTasks(),
    builder: (context, AsyncSnapshot<List<Task>> snapshot) {
      final tasks = snapshot.data ?? List();

      return ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (_, index) {
          final itemTask = tasks[index];
          return _buildListItem(itemTask, dao);
        },
      );
    },
  );
}

Widget _buildListItem(Task itemTask, TaskDao dao) {
  return Slidable(
    actionPane: SlidableDrawerActionPane(),
    secondaryActions: <Widget>[
      IconSlideAction(
        caption: "Delete",
        color: Colors.red,
        icon: Icons.delete,
        onTap: () => dao.deleteTask(itemTask),
      )
    ],
    child: CheckboxListTile(
      title: Text(itemTask.title),
      subtitle: Text(itemTask.dueDate?.toString() ?? "No Date"),
      value: itemTask.completed,
      onChanged: (newValue) {
        dao.updateTask(itemTask.copyWith(completed: newValue));
      },
    ),
  );
}

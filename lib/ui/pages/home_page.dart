import 'package:flutter/material.dart';
import 'package:noted/database/appdb.dart';
import 'package:noted/database/daos/task_dao.dart';
import 'package:noted/ui/widgets/custom_dismissible_item.dart';
import 'package:noted/ui/widgets/new_task_input.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Do Something?"),
        centerTitle: true,
      ),
      body: _buildTaskList(context),
      bottomNavigationBar: BottomAppBar(
        child: NewTaskInput(),
      ),
    );
  }

  StreamBuilder<List<Task>> _buildTaskList(BuildContext context) {
    final database = Provider.of<TaskDao>(context);
    return StreamBuilder(
      stream: database.watchAllTasks(),
      builder: (context, AsyncSnapshot<List<Task>> snapshot) {
        final tasks = snapshot.data ?? List();
        return ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (_, index) {
              final itemTask = tasks[index];
              return CustomDismissibleItem(
                key: Key(itemTask.id.toString()),
                task: itemTask,
                onTap: () {                 
                  database.updateTask(itemTask.copyWith(isComplete: !itemTask.isComplete));
                },
                onDismissed: (_) {
                  database.deleteTask(itemTask);

                },
              );
            });
      },
    );
  }
}
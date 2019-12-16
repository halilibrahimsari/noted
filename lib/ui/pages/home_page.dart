import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:noted/database/appdb.dart';
import 'package:noted/ui/widgets/new_task_input.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Do Something?"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: _buildTaskList(context),
          ),
        ],
      ),
      bottomSheet: Material(
        elevation: 12,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: NewTaskInput(),
          ),
        ),
      ),
    );
  }

  StreamBuilder<List<Task>> _buildTaskList(BuildContext context) {
    final database = Provider.of<TaskDao>(context);
    return StreamBuilder(
      stream: database.watchUncompletedTasks(),
      builder: (context, AsyncSnapshot<List<Task>> snapshot) {
        final tasks = snapshot.data ?? List();
        return ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (_, index) {
              final itemTask = tasks[index];
              return Card(
                elevation: 3,
                margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: Slidable(
                  actionPane: SlidableDrawerActionPane(),
                  secondaryActions: <Widget>[
                    IconSlideAction(
                      caption: "Delete",
                      color: Colors.red,
                      icon: Icons.delete,
                      onTap: () => database.deleteTask(itemTask),
                    )
                  ],
                  child: CheckboxListTile(
                    value: itemTask.isComplete,
                    onChanged: (newValue) {
                      database.updateTask(itemTask.copyWith(isComplete: newValue));
                    },
                    title: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(itemTask.title),
                          Material(
                            borderRadius: BorderRadius.circular(10),
                            elevation: 2,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Text(
                                  itemTask.expDate?.toString() ?? "No Date"),
                            ),
                          ),
                        ],
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(itemTask.desc),
                    ),
                  ),
                ),
              );
            });
      },
    );
  }
}

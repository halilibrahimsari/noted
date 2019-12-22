import 'package:moor_flutter/moor_flutter.dart';
import 'package:noted/database/tables/tasks.dart';

import '../appdb.dart';

part 'task_dao.g.dart';

@UseDao(tables: [Tasks])
class TaskDao extends DatabaseAccessor<Appdb> with _$TaskDaoMixin {
  final Appdb db;

  TaskDao(this.db) : super(db);

  Future<List<Task>> getAllTasks() => select(tasks).get();

  Stream<List<Task>> watchUncompletedTasks() {
    return (select(tasks)
          ..orderBy([
            (t) => OrderingTerm(expression: t.expDate, mode: OrderingMode.desc),
            (t) => OrderingTerm(expression: t.title),
          ])
          ..where((t) => t.isComplete.equals(false)))
        .watch();
  }
    Stream<List<Task>> watchAllTasks() {
    return (select(tasks)
          ..orderBy([
            (t) => OrderingTerm(expression: t.expDate, mode: OrderingMode.desc),
            (t) => OrderingTerm(expression: t.title),
          ])
          )
        .watch();
  }

  Stream<List<Task>> watchcompletedTasks() {
    return (select(tasks)
          ..orderBy([
            (t) => OrderingTerm(expression: t.expDate, mode: OrderingMode.desc),
            (t) => OrderingTerm(expression: t.title),
          ])
          ..where((t) => t.isComplete.equals(true)))
        .watch();
  }

  Future insertTask(Insertable<Task> task) {
    return into(tasks).insert(task);
  }

  Future updateTask(Insertable<Task> task) => update(tasks).replace(task);
  Future deleteTask(Insertable<Task> task) => delete(tasks).delete(task);
}
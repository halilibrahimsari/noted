import 'package:moor_flutter/moor_flutter.dart';

part 'appdb.g.dart';

@UseMoor(tables: [Tasks], daos: [TaskDao])
class Appdb extends _$Appdb {
  Appdb()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: 'db.sqlite', logStatements: true));

  @override
  int get schemaVersion => 1;
}

class Tasks extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 1, max: 20)();
  TextColumn get desc => text().nullable()();
  DateTimeColumn get expDate => dateTime().nullable()();
  BoolColumn get isComplete => boolean().withDefault(Constant(false))();
}

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

  Stream<List<Task>> watchcompletedTasks() {
    return (select(tasks)
          ..orderBy([
            (t) => OrderingTerm(expression: t.expDate, mode: OrderingMode.desc),
            (t) => OrderingTerm(expression: t.title),
          ])
          ..where((t) => t.isComplete.equals(true)))
        .watch();
  }

  Future insertTask(Insertable<Task> task) => into(tasks).insert(task);
  Future updateTask(Insertable<Task> task) => update(tasks).replace(task);
  Future deleteTask(Insertable<Task> task) => delete(tasks).delete(task);
}

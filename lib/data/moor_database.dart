import 'package:moor_flutter/moor_flutter.dart';

part 'moor_database.g.dart';

@UseMoor(tables: [Tasks, Categories], daos: [TaskDao, CategoriesDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(
          FlutterQueryExecutor.inDatabaseFolder(
              path: 'db.sqlite', logStatements: true),
        );
  @override
  int get schemaVersion => 2;
}

class Tasks extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get color => integer().nullable()();
  TextColumn get title => text().withLength(min: 2, max: 15)();
  TextColumn get description => text().withLength(min: 2, max: 100)();
  DateTimeColumn get dueDate => dateTime().nullable()();
  BoolColumn get completed => boolean().withDefault(Constant(false))();
  IntColumn get categoriesId =>
      integer().nullable().customConstraint('NULL REFERENCES categories(id)')();
}

class Categories extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
}

@UseDao(tables: [Tasks])
class TaskDao extends DatabaseAccessor<AppDatabase> with _$TaskDaoMixin {
  final AppDatabase db;

  TaskDao(this.db) : super(db);

  Future<List<Task>> getAllTasks() => select(tasks).get();

  Stream<List<Task>> watchUncompletedTasks() {
    return (select(tasks)
          ..orderBy([
            (t) => OrderingTerm(expression: t.dueDate, mode: OrderingMode.desc),
            (t) => OrderingTerm(expression: t.title),
          ])
          ..where((t) => t.completed.equals(false)))
        .watch();
  }

  Stream<List<Task>> watchCompletedTasks() {
    return (select(tasks)
          ..orderBy([
            (t) => OrderingTerm(expression: t.dueDate, mode: OrderingMode.desc),
            (t) => OrderingTerm(expression: t.title),
          ])
          ..where((t) => t.completed.equals(true)))
        .watch();
  }

  Future insertTask(Insertable<Task> task) => into(tasks).insert(task);
  Future updateTask(Insertable<Task> task) => update(tasks).replace(task);
  Future deleteTask(Insertable<Task> task) => delete(tasks).delete(task);
}

@UseDao(tables: [Categories])
class CategoriesDao extends DatabaseAccessor<AppDatabase>
    with _$CategoriesDaoMixin {
  final AppDatabase db;

  CategoriesDao(this.db) : super(db);
}

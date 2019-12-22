// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appdb.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Task extends DataClass implements Insertable<Task> {
  final int id;
  final String title;
  final DateTime expDate;
  final bool isComplete;
  Task(
      {@required this.id,
      @required this.title,
      this.expDate,
      @required this.isComplete});
  factory Task.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final boolType = db.typeSystem.forDartType<bool>();
    return Task(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      title:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}title']),
      expDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}exp_date']),
      isComplete: boolType
          .mapFromDatabaseResponse(data['${effectivePrefix}is_complete']),
    );
  }
  factory Task.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return Task(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      expDate: serializer.fromJson<DateTime>(json['expDate']),
      isComplete: serializer.fromJson<bool>(json['isComplete']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'expDate': serializer.toJson<DateTime>(expDate),
      'isComplete': serializer.toJson<bool>(isComplete),
    };
  }

  @override
  TasksCompanion createCompanion(bool nullToAbsent) {
    return TasksCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      expDate: expDate == null && nullToAbsent
          ? const Value.absent()
          : Value(expDate),
      isComplete: isComplete == null && nullToAbsent
          ? const Value.absent()
          : Value(isComplete),
    );
  }

  Task copyWith({int id, String title, DateTime expDate, bool isComplete}) =>
      Task(
        id: id ?? this.id,
        title: title ?? this.title,
        expDate: expDate ?? this.expDate,
        isComplete: isComplete ?? this.isComplete,
      );
  @override
  String toString() {
    return (StringBuffer('Task(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('expDate: $expDate, ')
          ..write('isComplete: $isComplete')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(title.hashCode, $mrjc(expDate.hashCode, isComplete.hashCode))));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is Task &&
          other.id == this.id &&
          other.title == this.title &&
          other.expDate == this.expDate &&
          other.isComplete == this.isComplete);
}

class TasksCompanion extends UpdateCompanion<Task> {
  final Value<int> id;
  final Value<String> title;
  final Value<DateTime> expDate;
  final Value<bool> isComplete;
  const TasksCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.expDate = const Value.absent(),
    this.isComplete = const Value.absent(),
  });
  TasksCompanion.insert({
    this.id = const Value.absent(),
    @required String title,
    this.expDate = const Value.absent(),
    this.isComplete = const Value.absent(),
  }) : title = Value(title);
  TasksCompanion copyWith(
      {Value<int> id,
      Value<String> title,
      Value<DateTime> expDate,
      Value<bool> isComplete}) {
    return TasksCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      expDate: expDate ?? this.expDate,
      isComplete: isComplete ?? this.isComplete,
    );
  }
}

class $TasksTable extends Tasks with TableInfo<$TasksTable, Task> {
  final GeneratedDatabase _db;
  final String _alias;
  $TasksTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _titleMeta = const VerificationMeta('title');
  GeneratedTextColumn _title;
  @override
  GeneratedTextColumn get title => _title ??= _constructTitle();
  GeneratedTextColumn _constructTitle() {
    return GeneratedTextColumn('title', $tableName, false, minTextLength: 2);
  }

  final VerificationMeta _expDateMeta = const VerificationMeta('expDate');
  GeneratedDateTimeColumn _expDate;
  @override
  GeneratedDateTimeColumn get expDate => _expDate ??= _constructExpDate();
  GeneratedDateTimeColumn _constructExpDate() {
    return GeneratedDateTimeColumn(
      'exp_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _isCompleteMeta = const VerificationMeta('isComplete');
  GeneratedBoolColumn _isComplete;
  @override
  GeneratedBoolColumn get isComplete => _isComplete ??= _constructIsComplete();
  GeneratedBoolColumn _constructIsComplete() {
    return GeneratedBoolColumn('is_complete', $tableName, false,
        defaultValue: Constant(false));
  }

  @override
  List<GeneratedColumn> get $columns => [id, title, expDate, isComplete];
  @override
  $TasksTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'tasks';
  @override
  final String actualTableName = 'tasks';
  @override
  VerificationContext validateIntegrity(TasksCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (id.isRequired && isInserting) {
      context.missing(_idMeta);
    }
    if (d.title.present) {
      context.handle(
          _titleMeta, title.isAcceptableValue(d.title.value, _titleMeta));
    } else if (title.isRequired && isInserting) {
      context.missing(_titleMeta);
    }
    if (d.expDate.present) {
      context.handle(_expDateMeta,
          expDate.isAcceptableValue(d.expDate.value, _expDateMeta));
    } else if (expDate.isRequired && isInserting) {
      context.missing(_expDateMeta);
    }
    if (d.isComplete.present) {
      context.handle(_isCompleteMeta,
          isComplete.isAcceptableValue(d.isComplete.value, _isCompleteMeta));
    } else if (isComplete.isRequired && isInserting) {
      context.missing(_isCompleteMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Task map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Task.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(TasksCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.title.present) {
      map['title'] = Variable<String, StringType>(d.title.value);
    }
    if (d.expDate.present) {
      map['exp_date'] = Variable<DateTime, DateTimeType>(d.expDate.value);
    }
    if (d.isComplete.present) {
      map['is_complete'] = Variable<bool, BoolType>(d.isComplete.value);
    }
    return map;
  }

  @override
  $TasksTable createAlias(String alias) {
    return $TasksTable(_db, alias);
  }
}

abstract class _$Appdb extends GeneratedDatabase {
  _$Appdb(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $TasksTable _tasks;
  $TasksTable get tasks => _tasks ??= $TasksTable(this);
  TaskDao _taskDao;
  TaskDao get taskDao => _taskDao ??= TaskDao(this as Appdb);
  @override
  List<TableInfo> get allTables => [tasks];
}

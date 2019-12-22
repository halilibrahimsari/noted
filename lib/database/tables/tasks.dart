import 'package:moor_flutter/moor_flutter.dart';


class Tasks extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 2)();
  DateTimeColumn get expDate => dateTime().nullable()();
  BoolColumn get isComplete => boolean().withDefault(Constant(false))();
}
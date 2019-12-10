import 'package:flutter/material.dart';
import 'package:noted/ui/home_page.dart';
import 'package:provider/provider.dart';

import 'data/moor_database.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      builder: (_) => AppDatabase().taskDao,
      child: MaterialApp(
        title: 'Noted',
        home: HomePage(),
      ),
    );
  }
}

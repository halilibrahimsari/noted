import 'package:flutter/material.dart';
import 'package:noted/database/appdb.dart';
import 'package:noted/ui/pages/home_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final db = Appdb();
    return MultiProvider(
      providers: [
        Provider(builder: (_) => db.taskDao),
      ],
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.deepOrange),
        title: 'Noted',
        home: HomePage(),
      ),
    );
  }
}

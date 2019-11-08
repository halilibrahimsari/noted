import 'package:flutter/material.dart';
import 'package:noted/size_config.dart';
import 'package:noted/ui/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return MaterialApp(
              title: 'Noted',
              home: HomePage(),
            );
          },
        );
      },
    );
  }
}

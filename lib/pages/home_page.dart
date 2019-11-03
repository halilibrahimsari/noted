import 'package:flutter/material.dart';
import 'package:noted/app_theme.dart';
import 'package:noted/size_config.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final theme = AppTheme.instance;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: theme.appColor,),
      body: Column(
        children: <Widget>[
          Container(
            height: 20* SizeConfig.heightMultiplier,
            width: 20* SizeConfig.widthMultiplier,
            color: theme.appColor,
           ),
          FlatButton(onPressed: () {
            setState(() {
              print(theme.appColor);
             theme.isDark = !theme.isDark; 
            });
          }, child: Text("TEST"),)
        ],
      ),
    );
  }
}
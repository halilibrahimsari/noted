import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:moor/moor.dart';
import 'package:provider/provider.dart';

import '../data/moor_database.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';

class NewTaskPage extends StatefulWidget {
  @override
  _NewTaskPageState createState() => _NewTaskPageState();
}

class _NewTaskPageState extends State<NewTaskPage> {
  final formKey = GlobalKey<FormState>();
  DateTime newTaskDate;
  TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add new task"),
      ),
      body: Form(
        key: formKey,
        child: prefix0.Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: "Title"),
              validator: (input) => input.length < 2 && input.length > 15
                  ? "Title must be at least 2 and max 15 digits"
                  : null,
            ),
          ],
        ),
      ),
    );
  }
  
void _submit (){
  if (formKey.currentState.validate());
}
}

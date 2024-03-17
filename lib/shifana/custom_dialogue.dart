// ignore_for_file: use_key_in_widget_constructors, prefer_typing_uninitialized_variables, sort_child_properties_last

//import 'dart:html';


import 'package:flutter/material.dart';

class CustomDialogue extends StatelessWidget {
  final title;
  final content;
  final callback;
  final actionText;

  const CustomDialogue(this.title, this.content, this.callback,
      [this.actionText = "Reset"]);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      
      title: Center(child: Text(title)),
      content: Text(content),
      actions: <Widget>[
        TextButton(
            onPressed: callback,
            child: Text(actionText),
            style: TextButton.styleFrom(foregroundColor: Colors.black))
      ],
    );
  }
}



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ToolBar
{
  static AppBar toolbar()
  {
    return AppBar(
      backgroundColor:Colors.orange,
      title: const Text('FilmApp',style: TextStyle(color: Colors.black,fontSize: 20)),
    );
  }
}
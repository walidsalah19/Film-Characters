

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ToolBar
{
  static AppBar toolbar( String? name)
  {
    return AppBar(
      backgroundColor:Colors.orange,
      title:  Text(name!,style: TextStyle(color: Colors.black,fontSize: 20)),
    );
  }
}
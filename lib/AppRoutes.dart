

import 'package:filmapp/Presentation/Screans/CharacterDetailsScrean.dart';
import 'package:filmapp/Presentation/Screans/CharacterScrean.dart';
import 'package:flutter/material.dart';

class AppRoutes{
  Route? getRoutes(RouteSettings setting)
  {
    switch(setting.name)
    {
      case '/':
        return MaterialPageRoute(builder: (_)=>CharacterScrean());
      case '/details':
        return MaterialPageRoute(builder: (_)=>CharacterDetailsScrean());
    }
  }
}
import 'package:filmapp/AppRoutes.dart';
import 'package:filmapp/Data/Web_Services/CharacterApi.dart';
import 'package:filmapp/Presentation/Screans/CharacterDetailsScrean.dart';
import 'package:filmapp/Presentation/Screans/CharacterScrean.dart';
import 'package:filmapp/Presentation/Screans/CharacterDetailsScrean.dart';
import 'package:flutter/material.dart';

void main() => runApp( MyApp());


class MyApp extends StatelessWidget {
   final AppRoutes app=AppRoutes();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: app.getRoutes,
     /* initialRoute: "/",
      routes: {
        '/':(context)=>CharacterScrean(),
        '/details':(context)=>CharacterDetailsScrean(),
      },*/
    );
  }
}

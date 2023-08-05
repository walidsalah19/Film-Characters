
import 'package:filmapp/Data/Model/CharacterModel.dart';
import 'package:filmapp/Data/Repo/CharacterRepo.dart';
import 'package:filmapp/Data/Web_Services/CharacterApi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:filmapp/Presentation/Widget/ToolBar.dart';


class CharacterScrean extends StatefulWidget
{

  @override
  State<StatefulWidget> createState()=>CharacterScreanState();

}
class CharacterScreanState extends State
{
  final CharacterRepo repo=CharacterRepo(CharacterApi());
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: ToolBar.toolbar(),
     body: Center(
       child:OutlinedButton(
         onPressed: () {
           _data();
         }, child: Text("Press"),

       ),
     ),
   );
  }
  _data () async
  {
    final  ff= await repo.getAllCharacters();
    print("values");
   print( ff?.map((e) =>e.name));
  }
}
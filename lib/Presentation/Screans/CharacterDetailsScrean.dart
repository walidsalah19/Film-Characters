import 'package:filmapp/Constant/MyColors.dart';
import 'package:filmapp/Data/Model/CharacterModel.dart';
import 'package:filmapp/Presentation/Widget/ToolBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CharacterDetailsScrean extends StatelessWidget {
  Results character;

  CharacterDetailsScrean(this.character);

  void _moveToDetails(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/');
  }

  Widget _buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          title: Text(
            character.name!,
            style: const TextStyle(color: MyColors.myGrey),
          ),
          background: Hero(
            tag: character.id!,
            child: Image.network(character.image!, fit: BoxFit.cover),
          )),
    );
  }

  Widget _buildSliverList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return ListTile(title: Text('Item $index'));
        },
        childCount: 5,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        leading: IconButton(
          color: MyColors.myGrey,
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            _moveToDetails(context);
          },
        ),
        backgroundColor:Colors.orange,
        title:  Text(character.name!,style: const TextStyle(color: Colors.black,fontSize: 20)),
      ),*/
      backgroundColor: MyColors.myGrey,
      body: CustomScrollView(
        slivers: [_buildSliverAppBar(), _buildSliverList()],
      ),
    );
  }
}

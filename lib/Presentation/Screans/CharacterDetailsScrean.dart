import 'package:filmapp/Constant/MyColors.dart';
import 'package:filmapp/Data/Model/CharacterModel.dart';
import 'package:filmapp/Presentation/Widget/ToolBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CharacterDetailsScrean extends StatelessWidget {
  Results character;

  CharacterDetailsScrean(this.character);

  void _moveToMainScreen(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/');
  }

  Widget _buildSliverAppBar(BuildContext context) {
    return SliverAppBar(
      leading: IconButton(
        style: ButtonStyle(iconSize: MaterialStateProperty.all(70)),
        color: MyColors.myYellow,
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          _moveToMainScreen(context);
        },
      ),
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: MyColors.myGrey,
      flexibleSpace: FlexibleSpaceBar(
          centerTitle: false,
          title: Text(
            character.name!,
            style: const TextStyle(color: MyColors.myYellow),
          ),
          background: Hero(
            tag: character.id!,
            child: Image.network(character.image!, fit: BoxFit.cover),
          )),
    );
  }

  Widget _buildSliverList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildInfoDetails("Gender : ", character.gender!),
                _buildDivider(305),
                _buildInfoDetails("Species : ", character.species!),
                _buildDivider(300),
                _buildInfoDetails("Origin : ", character.origin!.name!),
                _buildDivider(315),
                _buildInfoDetails("Location : ", character.location!.name!),
                _buildDivider(290),
                _buildInfoDetails("Created : ", character.created!),
                _buildDivider(300),
                const SizedBox(
                  height: 700,
                )
              ],
            ));
      }, childCount: 1),
    );
  }

  Widget _buildInfoDetails(String title, String des) {
    return RichText(
      text: TextSpan(children: [
        TextSpan(
            text: title,
            style: const TextStyle(
                fontSize: 18,
                color: MyColors.myWhite,
                fontWeight: FontWeight.bold)),
        TextSpan(
            text: des,
            style: const TextStyle(
              fontSize: 18,
              color: MyColors.myWhite,
            ))
      ]),
      maxLines: 1,
      textAlign: TextAlign.start,
    );
  }

  Widget _buildDivider(double endInd) {
    return Divider(
      color: MyColors.myYellow,
      height: 25,
      endIndent: endInd,
      thickness: 2,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myGrey,
      body: CustomScrollView(

        slivers: [_buildSliverAppBar(context), _buildSliverList()],
      ),
    );
  }
}

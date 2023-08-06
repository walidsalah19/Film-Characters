import 'package:filmapp/Constant/MyColors.dart';
import 'package:filmapp/Data/Model/CharacterModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GridCharacterItem extends StatelessWidget {
  final Results results;

  GridCharacterItem(this.results, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: MyColors.myWhite,
        border: Border.all(
          color: MyColors.myYellow,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: MyColors.myGrey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: GridTile(
        footer: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration:const BoxDecoration(
            color: MyColors.myWhite
          ),
          child: Text(
            results.name!,
            style: const TextStyle(fontSize: 18, color: MyColors.myYellow,backgroundColor: MyColors.myWhite),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            textAlign: TextAlign.center,
          ),
        ),
        child: Container(
            child: results.image!.isNotEmpty
                ? FadeInImage.assetNetwork(
                    width: double.infinity,
                    placeholder: 'assets/loading.gif',
                    image: results.image!,
                    fit: BoxFit.cover,
                  )
                : Image.asset('assets/image.png')),
      ),
    );
  }
}

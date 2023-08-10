import 'package:filmapp/Business/characters_cubit.dart';
import 'package:filmapp/Constant/MyColors.dart';
import 'package:filmapp/Data/Model/CharacterModel.dart';
import 'package:filmapp/Data/Repo/CharacterRepo.dart';
import 'package:filmapp/Data/Web_Services/CharacterApi.dart';
import 'package:filmapp/Presentation/Widget/GridCharacteritem.dart';
import 'package:filmapp/Presentation/Widget/ProgressDialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:filmapp/Presentation/Widget/ToolBar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

class CharacterScrean extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CharacterScreanState();
}

class CharacterScreanState extends State {
  late List<Results> results;
  List<Results> search = [];

  String name = "press";

  Widget _showLoadingDialog(BuildContext context) {
    return Image.asset("assets/loading.gif");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    results = BlocProvider.of<CharactersCubit>(context).getAllCharacters();
  }

/*  void _moveToDetails(Results character) {
    Navigator.pushReplacementNamed(context, '/details', arguments: character);
  }*/

  Widget _createBuilder() {
    return BlocBuilder<CharactersCubit, CharactersState>(
        builder: (context, state) {
      if (state is CharactersLoaded) {
        //SmartDialog.dismiss();
        results = state.results;
        return _buildScrollView();
      } else {
        return Center(
          child: _showLoadingDialog(context),
        );
      }
    });
  }

  Widget _buildScrollView() {
    return SingleChildScrollView(
      child: Center(
        child: _buildListView(),
      ),
    );
  }

  Widget _buildListView() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1),
      itemCount: search.isEmpty ? results.length : search.length,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemBuilder: (context, index) {
        /*  return GestureDetector(
            onTap: () {
              _moveToDetails(results[index]);
              print(results[index].name);
            },
            child: GridCharacterItem(
                search.isEmpty ? results[index] : search[index]));*/
        return GridCharacterItem(
            search.isEmpty ? results[index] : search[index]);
      },
    );
  }

  Widget _searchBar() {
    return TextField(
      onChanged: (value) {
        if (value.isNotEmpty) {
          _filterItems(value);
        } else {
          search.clear();
          setState(() {});
        }
        print(value);
      },
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        hintText: 'Search..',
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: const BorderSide(color: MyColors.myYellow, width: 1)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: const BorderSide(color: MyColors.myYellow, width: 1)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
      ),
    );
  }

  void _filterItems(String value) {
    setState(() {
      search = results
          .where((element) =>
              element.name!.toLowerCase().startsWith(value.toLowerCase()))
          .toList();
    });
  }
  Widget _returnOfflinOrOnline(bool connected)
  {
    return Center(
      child: connected
          ? Column(
        children: [
          Padding(padding:const EdgeInsets.all(16.0), child: _searchBar()),
          Expanded(child: _createBuilder())
        ],
      )
          :Expanded(child:  Image.asset("assets/offline.gif",height: 300,width: 400,))
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ToolBar.toolbar("Film App"),
      body: OfflineBuilder(
        connectivityBuilder: (
          BuildContext context,
          ConnectivityResult connectivity,
          Widget child,
        ) {
          final bool connected = connectivity != ConnectivityResult.none;
          return _returnOfflinOrOnline( connected);
        },
        child:const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          ],
        ),
      ),
      /* Column(
          children: [
            Padding(padding: EdgeInsets.all(16.0), child: _searchBar()),
            Expanded(child: _createBuilder())
          ],
        )*/
    );
  }
}

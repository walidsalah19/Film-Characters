import 'package:filmapp/Business/characters_cubit.dart';
import 'package:filmapp/Data/Model/CharacterModel.dart';
import 'package:filmapp/Data/Repo/CharacterRepo.dart';
import 'package:filmapp/Data/Web_Services/CharacterApi.dart';
import 'package:filmapp/Presentation/Widget/GridCharacteritem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:filmapp/Presentation/Widget/ToolBar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharacterScrean extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CharacterScreanState();
}

class CharacterScreanState extends State {
  late List<Results> results;
  List<Results> search = [];

  String name = "press";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    results = BlocProvider.of<CharactersCubit>(context).getAllCharacters();
  }

  Widget _createBuilder() {
    return BlocBuilder<CharactersCubit, CharactersState>(
        builder: (context, state) {
      if (state is CharactersLoaded) {
        results = state.results;
        return _buildScrollView();
      } else {
        return Column(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              child: const Text(
                "No Data ",
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.orange, fontSize: 22),
              ),
            )
          ],
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
          setState(() {

          });
        }
        print(value);
      },
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        hintText: 'Search..',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ToolBar.toolbar(),
        body: Column(
          children: [
            Padding(padding: EdgeInsets.all(16.0), child: _searchBar()),
            Expanded(child: _createBuilder())
          ],
        ));
  }
}

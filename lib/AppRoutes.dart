import 'package:filmapp/Business/characters_cubit.dart';
import 'package:filmapp/Data/Model/CharacterModel.dart';
import 'package:filmapp/Data/Repo/CharacterRepo.dart';
import 'package:filmapp/Data/Web_Services/CharacterApi.dart';
import 'package:filmapp/Presentation/Screans/CharacterDetailsScrean.dart';
import 'package:filmapp/Presentation/Screans/CharacterScrean.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoutes {
  late CharacterApi api;
  late CharacterRepo repo;
  late CharactersCubit cubit;

  AppRoutes() {
    api = CharacterApi();
    repo=CharacterRepo(api);
    cubit=CharactersCubit(repo);
  }

  Route? getRoutes(RouteSettings setting) {
    switch (setting.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (_) => cubit,
                child: CharacterScrean()));
      case '/details':
        final Results cha=setting.arguments as Results;
        return MaterialPageRoute(builder: (_) => CharacterDetailsScrean(cha));
    }
  }
}

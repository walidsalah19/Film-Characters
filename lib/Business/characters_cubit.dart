import 'package:bloc/bloc.dart';
import 'package:filmapp/Data/Model/CharacterModel.dart';
import 'package:filmapp/Data/Repo/CharacterRepo.dart';
import 'package:meta/meta.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  late List<Results> characters=<Results>[];
  final CharacterRepo repo;
  CharactersCubit(this.repo) : super(CharactersInitial());
  List<Results> getAllCharacters(){
    repo.getAllCharacters().then((characters) =>
    {
      emit(CharactersLoaded(characters!)),
      this.characters=characters
    });
    return characters;
  }
}

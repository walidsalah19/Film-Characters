import 'package:filmapp/Data/Model/CharacterModel.dart';
import 'package:filmapp/Data/Web_Services/CharacterApi.dart';

class CharacterRepo {
  CharacterApi api;
  CharacterRepo(this.api);
  Future<List<Results>?> getAllCharacters() async {
    final m = await api.getAllCharacter();
    return Character.fromJson(m).results ;
  }
}

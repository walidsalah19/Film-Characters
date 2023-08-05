import 'package:dio/dio.dart';
import 'package:filmapp/Constant/Strings.dart';
import 'package:filmapp/Data/Model/CharacterModel.dart';

class CharacterApi {
  late Dio dio;

  CharacterApi() {
    BaseOptions options = BaseOptions(
        baseUrl: Strings.baseUrl,
        persistentConnection: true,
        connectTimeout: const Duration(seconds: 20),
        sendTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
        receiveDataWhenStatusError: true);
    dio = Dio(options);
  }

  Future<Map<String, dynamic>> getAllCharacter() async {
    try {
      Response response = await dio.get('character');
      print(response.data);
      return response.data;
    }catch(e)
    {
      print("jjjjjjjjjjjjjjjjjj");
      print(e);
      return Map();
    }
  }
}

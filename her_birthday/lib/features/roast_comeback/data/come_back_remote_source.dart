import 'package:dio/dio.dart';
import 'package:her_birthday/core/constants/base_url.dart';
import 'package:injectable/injectable.dart';

abstract class ComeBackRemoteSource {
  Future<String>  getComeback(String message);
}


@LazySingleton(as: ComeBackRemoteSource)
class ComeBackRemoteSourceImpl extends ComeBackRemoteSource{
   static const String _baseUrl = BaseUrl.baseUrl;
  static const String _apiKey = BaseUrl.geminiApiKey;

  final Dio _dio;

  ComeBackRemoteSourceImpl(this._dio);

  @override
  Future<String> getComeback(String message) async {
    try {
      final response = await _dio.post(
        '$_baseUrl?key=$_apiKey',
        options: Options(headers: {'Content-Type': 'application/json'}),
        data: {
          "contents": [
            {
              "role": "user",
              "parts": [
                {
                  "text":
                      "Generate one a savage comeback send only comeback directly no greeting no extra text for: '$message'."
                }
              ]
            }
          ]
        },
      );

      final content =
          response.data['candidates']?[0]?['content']?['parts']?[0]?['text'];
      return content ?? "Sorry, I couldn't understand that.";
    } catch (e) {
      print("Gemini API error: $e");
      return "Something went wrong Please try again later.";
    }
  }
}
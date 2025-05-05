import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../core/constants/base_url.dart';

abstract class IGeminiService {
  Future<String> sendMessage(String message, String contextChat);
}

@LazySingleton(as: IGeminiService)
class GeminiService extends IGeminiService {
  static const String _baseUrl = BaseUrl.baseUrl;
  static const String _apiKey = BaseUrl.geminiApiKey;

  final Dio _dio;

  GeminiService(this._dio);

  @override
  Future<String> sendMessage(String message, String contextChat) async {
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
                      "You are an AI assistant. Below is the context of the conversation so far:$contextChat Now, please respond to the following question: $message"
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


import 'package:injectable/injectable.dart';
import 'package:her_birthday/features/ai_chat/data/ai_chat_remote_data_source.dart';
import 'package:her_birthday/features/ai_chat/domain/ai_chat_repo.dart';

@LazySingleton(as: AiRepository)
class AiRepositoryImpl extends AiRepository{

  final IGeminiService _geminiService;

  AiRepositoryImpl(this._geminiService);

  @override
  Future<String> sendMessage(String message, String contextChat) async {
    return _geminiService.sendMessage(message, contextChat);
  }

}
import 'package:injectable/injectable.dart';
import 'package:her_birthday/features/ai_chat/domain/ai_chat_repo.dart';

@lazySingleton
class AiChatUseCase {

  final AiRepository _aiRepository;
  AiChatUseCase(this._aiRepository);

  Future<String> sendMessage(String message, String contextChat) async {
    return _aiRepository.sendMessage(message, contextChat);
  }
}
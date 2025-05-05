import 'package:her_birthday/features/ai_chat/data/model/chat_model.dart';

sealed class AiChatState {}

class AiChatInitial extends AiChatState {}

class AiChatSuccess extends AiChatState {
  final List<ChatMessage> messages;
  final bool isLoading;

  AiChatSuccess(this.messages, {this.isLoading = false});
}

class AiChatFailure extends AiChatState {
  final String failureMessage;
  AiChatFailure(this.failureMessage);
}

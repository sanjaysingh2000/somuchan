import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:her_birthday/features/ai_chat/data/model/chat_model.dart';
import 'package:her_birthday/features/ai_chat/domain/ai_chat_usecase.dart';
import 'package:her_birthday/features/ai_chat/presentation/bloc/ai_event.dart';
import 'package:her_birthday/features/ai_chat/presentation/bloc/ai_state.dart';

@injectable
class AiChatBloc extends Bloc<AiChatEvent, AiChatState> {
  final AiChatUseCase _aiChatUsecase;
  List<ChatMessage> _messages = [];

  AiChatBloc(this._aiChatUsecase) : super(AiChatInitial()) {
    on<SendMessage>(_sendMessage);
  }

  Future<void> _sendMessage(
      SendMessage event, Emitter<AiChatState> emit) async {
    final userMessage = ChatMessage(event.message, isUser: true);
    _messages.add(userMessage);

    // Build the contextChat string from the history of messages
    String contextChat = '';
    for (var message in _messages) {
      contextChat += '${message.isUser ? "User" : "AI"}: ${message.text}\n';
    }

    //final userMessage = ChatMessage(event.message, isUser: true);
    //_messages.add(userMessage);

    // Emit user message with loading true
    emit(AiChatSuccess(List.from(_messages), isLoading: true));

    try {
      final response =
          await _aiChatUsecase.sendMessage(event.message, contextChat);
      final aiMessage = ChatMessage(response, isUser: false);
      _messages.add(aiMessage);

      // Emit updated list with loading false
      emit(AiChatSuccess(List.from(_messages), isLoading: false));
    } catch (e) {
      emit(AiChatFailure("Something went wrong!"));
    }
  }
}

sealed class AiChatEvent {}


class SendMessage extends AiChatEvent{
  SendMessage(this.message);
  final String message;
}
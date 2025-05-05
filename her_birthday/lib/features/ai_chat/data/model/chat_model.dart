class ChatMessage {
  final String text;
  final bool isUser;

  ChatMessage(this.text, {required this.isUser});

  factory ChatMessage.fromJson(Map<String, dynamic> json) {
    return ChatMessage(
      json['text'] as String? ?? '',
      isUser: json['isUser'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'isUser': isUser,
    };
  }
}

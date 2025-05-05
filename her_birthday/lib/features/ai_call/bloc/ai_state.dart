import 'package:equatable/equatable.dart';

class AiCallingState extends Equatable {
  final int elapsedTime;
  final String latestCallId;
  final List<dynamic> calls;
  final String transcript;
  final String summary;
  final List<Map<String, String>> messages;

  const AiCallingState({
    this.elapsedTime = 0,
    this.latestCallId = '',
    this.calls = const [],
    this.transcript = '',
    this.summary = '',
    this.messages = const [],
  });

  AiCallingState copyWith({
    int? elapsedTime,
    String? latestCallId,
    List<dynamic>? calls,
    String? transcript,
    String? summary,
    List<Map<String, String>>? messages,
  }) {
    return AiCallingState(
      elapsedTime: elapsedTime ?? this.elapsedTime,
      latestCallId: latestCallId ?? this.latestCallId,
      calls: calls ?? this.calls,
      transcript: transcript ?? this.transcript,
      summary: summary ?? this.summary,
      messages: messages ?? this.messages,
    );
  }

  @override
  List<Object> get props =>
      [elapsedTime, latestCallId, calls, transcript, summary, messages];
}

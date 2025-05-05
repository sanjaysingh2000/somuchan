import 'package:freezed_annotation/freezed_annotation.dart';

part 'internet_event.freezed.dart';

@freezed
class InternetEvent with _$InternetEvent {
  // Triggered to start listening for connectivity status changes
  const factory InternetEvent.started() = InternetStarted;
  
  // Triggered when internet status changes
  const factory InternetEvent.statusChanged({required bool isConnected}) = InternetStatusChanged;
}

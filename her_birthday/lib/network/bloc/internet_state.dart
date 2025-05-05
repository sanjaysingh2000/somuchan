import 'package:freezed_annotation/freezed_annotation.dart';

part 'internet_state.freezed.dart';

@freezed
class InternetState with _$InternetState {
  const factory InternetState.initial() = _Initial;
  const factory InternetState.connected() = _Connected;
  const factory InternetState.disconnected() = _Disconnected;
}

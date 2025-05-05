// import 'dart:async';
// import 'package:bloc/bloc.dart';
// import 'package:her_birthday/features/ai_call/bloc/ai_state.dart';

// class AiCallingCubit extends Cubit<AiCallingState> {
//   Timer? _timer;

//   AiCallingCubit() : super(const AiCallingState());

//   void startTimer() {
//     if (_timer == null || !_timer!.isActive) {
//       emit(state.copyWith(elapsedTime: 0));
//       _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
//         emit(state.copyWith(elapsedTime: state.elapsedTime + 1));
//       });
//     }
//     print('call started');
//   }

//   void stopTimer() {
//     _timer?.cancel();
//     _timer = null;
//     print('call stopped at - ${state.elapsedTime}');
//   }

//   String formatTime(int elapsedTime) {
//     int minutes = elapsedTime ~/ 60;
//     int seconds = elapsedTime % 60;
//     return '${_twoDigitFormat(minutes)}:${_twoDigitFormat(seconds)}';
//   }

//   String _twoDigitFormat(int number) {
//     return number.toString().padLeft(2, '0');
//   }
// }

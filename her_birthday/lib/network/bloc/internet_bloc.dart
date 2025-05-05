import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:her_birthday/network/bloc/internet_event.dart';
import 'package:her_birthday/network/bloc/internet_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class InternetBloc extends Bloc<InternetEvent, InternetState> {
  final Connectivity _connectivity;
  StreamSubscription<List<ConnectivityResult>>? _connectivitySubscription;

  InternetBloc(this._connectivity) : super(const InternetState.initial()) {
    on<InternetStarted>(_onStarted);
    on<InternetStatusChanged>(_onInternetStatusChanged);

    // Trigger the initial event to start listening for connectivity changes
    add(const InternetEvent.started());
  }

  Future<void> _onStarted(InternetStarted event, Emitter<InternetState> emit) async {
  try {
    // Get initial connectivity status
    final initialResult = (await _connectivity.checkConnectivity()).first;
    add(InternetEvent.statusChanged(
      isConnected: initialResult != ConnectivityResult.none
    ));

    // Listen for changes
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(
      (List<ConnectivityResult> results) {
        final result = results.first;
        add(InternetEvent.statusChanged(
          isConnected: result != ConnectivityResult.none
        ));
      },
      onError: (error) {
        emit(const InternetState.disconnected());
      },
    );
  } catch (e) {
    emit(const InternetState.disconnected());
  }
}

  void _onInternetStatusChanged(
    InternetStatusChanged event,
    Emitter<InternetState> emit,
  ) {
    if (event.isConnected) {
      emit(const InternetState.connected());
    } else {
      emit(const InternetState.disconnected());
    }
  }

  @override
  Future<void> close() {
    // Cancel the connectivity subscription to avoid memory leaks
    _connectivitySubscription?.cancel();
    return super.close();
  }
}

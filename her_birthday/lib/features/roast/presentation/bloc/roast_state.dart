sealed class RoastState {
  const RoastState();
}

class RoastStateInitial extends RoastState {
  const RoastStateInitial();
}

class RoastStateLoading extends RoastState {
  const RoastStateLoading();
}

class RoastStateLoaded extends RoastState {
  final String roast;
  const RoastStateLoaded(this.roast);
}

class RoastStateError extends RoastState {
  final String error;
  const RoastStateError(this.error);
}
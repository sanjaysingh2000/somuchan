sealed class ComebackState {}

class ComebackStateInitial extends ComebackState {
}

class ComebackStateLoading extends ComebackState {
}

class ComebackStateLoaded extends ComebackState {
  final String comeback;
   ComebackStateLoaded(this.comeback);
}

class ComebackStateError extends ComebackState {
  final String error;
   ComebackStateError(this.error);
}
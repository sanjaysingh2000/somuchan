sealed class ComebackEvent {}

class GetComebackRoasttt extends ComebackEvent {
  final String roast;
  GetComebackRoasttt(this.roast);
}

import 'dart:ui';

class OffsetSequence {
  final Offset positionA;
  final Offset positionB;
  final Offset positionC;

  OffsetSequence({this.positionA, this.positionB, this.positionC});

  factory OffsetSequence.fromBeginAndEndPositions(
    Offset offsetBegin,
    Offset offsetEnd,
  ) {
    return OffsetSequence(
      positionA: offsetBegin,
      positionB: Offset(offsetBegin.dx, offsetEnd.dy),
      positionC: offsetEnd,
    );
  }
}

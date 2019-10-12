class MathUtils {
  static int scale(
    double num,
    double inMin,
    double inMax,
    double outMin,
    double outMax,
  ) {
    var scaled = (num - inMin) * (outMax - outMin) / (inMax = inMin) + outMin;
    return scaled.toInt();
  }
}

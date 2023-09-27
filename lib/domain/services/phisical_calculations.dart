class PhisicalCalc {
  double G;

  PhisicalCalc({this.G = 5});

  double getAttractiveForce(double mass1, double mass2, double range) {
    final force = G * mass1 * mass2 / (range * range);
    return force;
  }
}
import 'dart:math';

class Vector {
  double x;
  double y;

  Vector({this.x = 0, this.y = 0});

  Vector add(Vector a) {
    x += a.x;
    y += a.y;
    return this;
  }

  Vector sub(Vector a) {
    x -= a.x;
    y -= a.y;
    return this;
  }

  Vector mult(double n) {
    x *= n;
    y *= n;
    return this;
  }

  Vector div(double n) {
    x /= n;
    y /= n;
    return this;
  }

  Vector clone() {
    return Vector(x: x, y: y);
  }

  Vector getNegative() {
    return Vector(x: -x, y: -y);
  }

  double getLength() {
    return sqrt(x * x + y * y);
  }
}

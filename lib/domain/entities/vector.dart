import 'dart:math';

class Vector {
  double _x;
  double _y;

  Vector({double x = 0, double y = 0})
      : _x = x,
        _y = y;

  double getX() {
    return _x;
  }

  double getY() {
    return _y;
  }

  void setX(double x) {
    _x = x;
  }

  void setY(double y) {
    _y = y;
  }

  void setXY(Vector a) {
    _x = a.getX();
    _y = a.getY();
  }

  Vector getNegative() {
    _x = -_x;
    _y = -_y;
    return this;
  }

  Vector add(double x, double y) {
    _x += x;
    _y += y;
    return this;
  }

  Vector addVector(Vector a) {
    _x += a.getX();
    _y += a.getY();
    return this;
  }

  Vector sub(double x, double y) {
    _x -= x;
    _y -= y;
    return this;
  }

  Vector subVector(Vector a) {
    _x -= a.getX();
    _y -= a.getY();
    return this;
  }

  Vector mult(double n) {
    _x *= n;
    _y *= n;
    return this;
  }

  double getLength() {
    return sqrt(_x * _x + _y * _y);
  }

  Vector normilize() {
    final m = sqrt(_x * _x + _y * _y);
    if (m > 0) {
      _x /= m;
      _y /= m;
    }
    return this;
  }

  double distanceTo(double x, double y) {
    double dx = x - _x;
    double dy = y - _y;
    double distance = sqrt(dx * dx + dy * dy);
    return distance;
  }

  double distanceToVector(Vector a) {
    double dx = a.getX() - _x;
    double dy = a.getY() - _y;
    double distance = sqrt(dx * dx + dy * dy);
    return distance;
  }
}

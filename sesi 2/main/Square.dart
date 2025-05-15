import 'Shape.dart';

class Square extends Shape {
  double _length;

  Square(this._length);

  @override
  double getArea() {
    return _length * _length;
  }
}

import 'Hero.dart';

class Mage extends Hero {
  int? _magicPower;
  Mage(super.name, super.hp, super.atk, this._magicPower);

  @override
  void displayInformation() {
    super.displayInformation();
    print('Magic Power: ${_magicPower}');
  }
}

import 'Hero.dart';

class Warrior extends Hero {
  int? _armor;

  Warrior(super.name, super.hp, super.atk, this._armor);

  @override
  void displayInformation() {
    super.displayInformation();
    print('Armor: ${_armor}');
  }
}

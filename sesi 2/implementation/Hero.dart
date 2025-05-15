abstract class Hero {
  String? _name;
  int? _atk;
  int? _hp;

  Hero(this._name, this._hp, this._atk);

  void displayInformation() {
    print("===[ ${_name}'s Information ]===");
    print("HP: ${this.getHp()}");
    print("ATK: ${this.getAtk()}");
  }

  String? getName() {
    return this._name;
  }

  int? getAtk() {
    return this._atk;
  }

  int? getHp() {
    return this._hp;
  }
}

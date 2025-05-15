import 'Hero.dart';
import 'dart:io';
import 'Mage.dart';
import 'Warrior.dart';

List<Hero> heroes = [];

void _showHeroInformation() {
  if (heroes.isEmpty) {
    print("Can't access the hero's information, because the list is empty.");
    print("Press ENTER to continue");
    stdin.readLineSync();
    return;
  }

  print("");
  for (int i = 0; i < heroes.length; i++) {
    print("${i + 1}. ${heroes[i].getName()}");
  }
  print("");
  
  while (true) {
    stdout.write("Input [1-${heroes.length}] [0 to cancel]: ");
    String? input = stdin.readLineSync();
    int inputNum = int.tryParse(input ?? '') ?? -1;

    if (inputNum == 0) return;
    if (inputNum >= 1 && inputNum <= heroes.length) {
      heroes[inputNum - 1].displayInformation();
      break;
    }
    print("Invalid input! Try again.");
  }

  print("Press ENTER to continue");
  stdin.readLineSync();
}

void _addHero() {
  String? input;
  String? name;
  String? role;
  int? atk;
  int? hp;
  int? extra_attr;

  stdout.write("Input Name: ");
  name = stdin.readLineSync();
  print("");

  stdout.write("Input Hp: ");
  input = stdin.readLineSync();
  hp = int.tryParse(input ?? '') ?? 0;
  print("");

  stdout.write("Input Atk: ");
  input = stdin.readLineSync();
  atk = int.tryParse(input ?? '') ?? 0;
  print("");

  while (true) {
    stdout.write("Input Role [Warrior | Mage]: ");
    role = stdin.readLineSync();

    if (role == "Warrior" || role == "Mage") {
      break;
    }
  }
  print("");

  stdout.write("Input Extra Attribute: ");
  input = stdin.readLineSync();
  extra_attr = int.tryParse(input ?? '') ?? 0;
  print("");

  if (role == "Warrior") {
    heroes.add(new Warrior(name, hp, atk, extra_attr));
  } else {
    heroes.add(new Mage(name, hp, atk, extra_attr));
  }

  print("New Hero has been added");
  print("Press ENTER to continue");
  stdin.readLineSync();
}

void main() {
  int input;
  do {
    print("[ Simple Hero Information System ]");
    print("1. Show Hero's Information");
    print("2. Add Hero");
    print("3. Exit");

    stdout.write(">> ");
    String? userInput = stdin.readLineSync();
    input = int.tryParse(userInput ?? '') ?? 0;

    switch (input) {
      case 1:
        _showHeroInformation();
        break;
      case 2:
        _addHero();
        break;
      case 3:
        print("[ THANKS FOR USING THIS PROGRAM ]");
        print("[ CREATED BY: Niko Sutiono ]");
        break;
      default:
        print("Error: Invalid Input");
        print("Press ENTER to continue");
        stdin.readLineSync();
    }
    print("\n\n");
  } while (input != 3);
}

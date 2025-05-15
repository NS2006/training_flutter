   import 'dart:io';

// Function
// dataType functionName(parameter){
//   bodyFunction
// }


int add(int a, int b){
  return a+b;
}

void main() {
  /*
  // 1. Jenis Variable
  // var, final, const, late

  var name = "Rich"; // Tipe datanya String
  // name = 123; // Error karena nama tipe datanya String, bukan untuk simple angka

  final int age = 10; // Variabel hanya bisa diset sekali aja
  // age = 18; // Error karena variable age itu final dan udah diset sebelumnya

  const pi = 3.14; // Tipe datanya constant, tidak bisa kita set ulang nilainya
  // pi = 4.00; // Error karena constant tidak bisa direassign valuenya

  late String description;
  description = "testing123";
  description = "testing345";
  print(description);

  String? nama = null; // Variabel ini bisa di set ke null
  */

  /*
  // 2. Input Output
  // Output
  print("Hello World");

  // Input
  String? name = stdin.readLineSync();
  print("Name: ");
  print(name);
  */

  /*
  // 3. Data Type
  // Angka: int, double;

  int age = 10;
  double pi = 3.14;

  /*
  // String
  String name = "Rich";
  String desc = '''Halo
  Halo
  Halo''';
  print(desc);
  */

  // boolean
  bool isTrue = true;
  bool isFalse = false;

  // Collection
  // List
  // List<int> numbers = [1, 2, 3, 4, 5, 6];
  List<int> numbers = [5, 2, 3, 4, 5, 5, 6];
  // print(numbers);

  // Sets (hanya simpan angka unik)
  Set<int> nonDupes = {5, 2, 3, 4, 5, 5, 6};
  // print(nonDupes);

  // numbers.add(123);
  // numbers.removeAt(3); // removeAt itu di index
  // print(numbers);

  // nonDupes.add(123);
  // nonDupes.remove(1);
  // print(nonDupes);

  // Map => collection terdiri atas pairingan antara key dan value
  // key => index
  // value => value di index itu
  Map<String, String> phoneBook = {"Rich": "12345"};
  print(phoneBook["Rich"]);

  phoneBook["Ivan"] = "34567";
  print(phoneBook["Ivan"]);
  */

  // 4. Operator
  // Operator Arithmetics
  // int a = 5, b = 2;

  // print(a + b); // + => addition
  // print(a - b); // - => substraction
  // print(a * b); // * => multiplication
  // print(a / b); // / => division
  // print(a % b); // % => modulo (remainder dari division)

  // Equality dan Relational Operator
  // int a = 5, b = 10;
  // print(a == b); // == => sama dengan
  // print(a != b); // != => tidak sama dengan
  // print(a > b); // > => lebih besar
  // print(a < b); // < => lebih kecil
  // print(a >= b); // > => lebih besar sama dengan
  // print(a <= b); // < => lebih kecil sama dengan

  // Type Test Operator
  // var test = 10;
  // print(test is String); // is => tipenya sama, dia hasilin true
  // print(test is! String); // is! (isnot) => tipenya beda, dia hasilin true

  // Assignment Operator
  // int a = 5, b = 4;
  // a += b;
  // a -= b;
  // a *= b;
  // a ~/= b;
  // a %= b
  // print(a);

  // String? name;
  // String? name = "NSS";
  // print(name);

  // name ??= "NS";
  // print(name);

  // Logical Operator
  // bool a = true, b = false;
  // print(a && b); // AND operator
  // print(a || b); // OR operator
  // print(!a); // NOT operator

  // Selection
  // if
  // int score = 90;

  // if (score >= 90) {
  //   print("A");
  // } else if (score >= 85) {
  //   print("A-");
  // } else if (score >= 80) {
  //   print("B+");
  // } else {
  //   print("B");
  // }

  // switch
  // String weather = "Sunny";
  // switch (weather) {
  //   case "Sunny":
  //     print("Sunny Weather");
  //     break;
  //   case "Rainy":
  //     print("Rainy Weather");
  //     break;
  //   default:
  //     print("Default Weather");
  //     break;
  // }


  // // Repetition
  // // for
  // for(int i = 0; i < 10; i++){
  //   print(i);
  // }

  // // while
  // int i = 0;
  // while(i < 10){
  //   print(i);
  //   i++;
  // }

  // // do while
  // do{
  //   print(i);
  //   i++;
  // }while(i < 10);


  // print(add(1,2));
}
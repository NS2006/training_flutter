class Person {
  // attribute -> characteristic of a class
  String? _name;
  int? _age;

  static int count = 0;

  // constructor
  // Person(this.name, this.age);
  Person(String name, int age) {
    this._name = name;
    this._age = age;
    Person.count++;
  }

  // method -> function/method that a class can do
  void introduce() {
    print("Hello, my name is ${_name}. My age is ${_age}");
  }

  int birthday() {
    // need to add !, because of age can be null (int? age)
    return _age! + 1;
  }

  int? getAge() {
    return this._age;
  }

  String? getName() {
    return this._name;
  }

  void setName(String name) {
    this._name = name;
  }

  void setAge(int age) {
    this._age = age;
  }
}

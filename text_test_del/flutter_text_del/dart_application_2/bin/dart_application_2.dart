import 'package:dart_application_2/dart_application_2.dart' as dart_application_2;

void main() {
 var test = B();
 test.age = 10;
 test.printAge();
}

class A {
  A(){
    String name = "Alisa";
    print('class A');
  void printName(){
    print(name);
  }
  }
}
class B extends A{
  int age = 34;
  B(){
    print('class B');
  }
  void printAge(){
    print(age);
}
}
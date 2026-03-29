import 'Animal.dart';

class Gato extends Animal {
  String corPelo;
  Gato(String nome, int idade, this.corPelo) : super(nome, idade);

  @override
  void emitirSom() {
    print('Miau Miau');
  }

  void arranha() {
    print('O gato está arranhando o sofá');
  }
}

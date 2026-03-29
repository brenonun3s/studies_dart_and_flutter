import 'Animal.dart';

class Cachorro extends Animal {
  Cachorro(String nome, int idade) : super(nome, idade);

  @override
  void emitirSom() {
    print('AU AU');
  }

  void correndo() {
    print('o cachorro $nome esta correndo');
  }
}

abstract class Animal {
  String? nome;
  int? idade;

  Animal(this.nome, this.idade);

  void emitirSom();
  void dormir() {
    print('O animal está dormindo');
  }
}

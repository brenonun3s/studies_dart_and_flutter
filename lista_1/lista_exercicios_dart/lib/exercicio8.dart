import 'dart:io';

//Exercício 8: Antecessor e Sucessor Leia um número inteiro e mostre seu antecessor e sucessor.


void antecessorESucessor() {
  print('Digite um numero para ver o sucessor e antecessor dele');
  String? entrada = stdin.readLineSync();
  if (entrada != null) {
    int nota = int.parse(entrada);
    int antecessor = nota - 1;
    int sucessor = nota + 1;
    print('Antecessor do numero $nota = $antecessor');
    print('Sucessor do numero $nota = $sucessor');
  }
}

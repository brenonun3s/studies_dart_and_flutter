import 'dart:io';

//Exercício 10: Dias de Vida Calcule quantos dias de vida uma pessoa tem, considerando a idade em anos fornecida.

void calculaIdadePessoa() {
  print('Digite sua idade');
  String? entrada = stdin.readLineSync();

  if (entrada != null) {
    int idade = int.parse(entrada);

    int diasDeVida = idade * 365;

    print('Você já viveu $diasDeVida dias até hoje!');
  }
}

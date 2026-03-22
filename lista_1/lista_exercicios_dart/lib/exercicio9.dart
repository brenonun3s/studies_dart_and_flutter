import 'dart:io';

//Exercício 9: Área do Retângulo Calcule a área de um retângulo com base na base e altura fornecidas.

void calculaAreaRetangulo() {
  print('Digite a altura do retangulo');
  String? entrada = stdin.readLineSync();

  print('Digite a base do retangulo');
  String? entrada2 = stdin.readLineSync();

  if (entrada != null && entrada2 != null) {
    int altura = int.parse(entrada);
    int base = int.parse(entrada2);

    int area = base * altura;

    print('Area do retangulo: $area');
  }
}

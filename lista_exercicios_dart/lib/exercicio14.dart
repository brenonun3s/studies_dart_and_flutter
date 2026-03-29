import 'dart:io';
//Exercício 14: Fatorial Calcule o fatorial de um número fornecido.

void fatorial(){
  print("Digite um numero para calcularmos o fatorial");
  String? entrada = stdin.readLineSync();

if(entrada != null){
  int numero = int.parse(entrada);
  int resultado = 1;

  for (int i = numero; i >= 1; --i) {
    resultado = resultado * i;
  }

  print('Fatorial do número $numero = $resultado');
}

}
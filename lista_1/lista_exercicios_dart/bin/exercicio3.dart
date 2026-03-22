import 'dart:io';

//Exercício 3: Par ou Ímpar Faça um programa que leia um número inteiro e determine se ele é par ou ímpar.


void main(List<String> args) {
  
  print("Digite um numero: ");

  String? entrada = stdin.readLineSync();

  if(entrada != null){
    int numero = int.parse(entrada);

    if(numero % 2 == 0){
      print('É par');
    }
    else{
      print('É impar');
      }
  }
  else{
    print('Entrada não infromada');
  }
}
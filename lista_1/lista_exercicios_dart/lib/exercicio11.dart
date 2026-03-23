import 'dart:io';

/*Exercício 11: Manipulação de Strings Crie um programa que leia uma frase e mostre:
  * Número de caracteres
  * Número de palavras
  * Versão em maiúsculas
  * Versão em minúsculas
*/


void manipulaStrings() {
  print('Digite sua frase');
  String? entrada = stdin.readLineSync();

  if (entrada != null) {
    int tamanho = entrada.length;

    print("Tamanho da frase: $tamanho");

    List<String> lista = entrada.trim().split(" ");
    int palavras = lista.length;
    print("Quantidade de palavras = $palavras");

    String maiuscula = entrada.toUpperCase();
    String minuscula = entrada.toLowerCase();

    print("Frase em maiscula $maiuscula");
    print("Frase em minuscula $minuscula");


  }
}
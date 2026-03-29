import 'dart:io';

//Exercício 17: Calculadora de Juros Simples Calcule o montante final com juros simples.

void jurosSimples(){
  print('Digite o valor de capital para calcular os juros simples');
  String? capital = stdin.readLineSync();

  print('Digite a taxa de juros (EX.: 10% = 0.10)');
  String? juros = stdin.readLineSync();

  print('Digite o tempo em meses para calcular os juros simples');
  String? tempo = stdin.readLineSync();


  if (capital != null && juros != null && tempo != null) {
    double valor = double.parse(capital);
    int tempoJuros = int.parse(tempo);
    double jurosTaxa = double.parse(juros);
    double montante = valor * (1 + jurosTaxa * tempoJuros);

    print('Juros Simples= $montante');
    
  }

}
import 'dart:io';

//Exercício 5: Tabuada Elabore um programa que mostre a tabuada de um número fornecido pelo usuário (de 1 a 10).


const String ABAIXO_PESO = 'Abaixo do Peso, consulte um nutricionista!';
const String PESO_IDEAL = 'Está com o peso no esquema!';
const String OBESO = 'Obeso';

String? calcularIMC() {
  print('Digite seu peso: ');
  String? entrada = stdin.readLineSync();
  print('Digite sua altura: ');
  String? entrada2 = stdin.readLineSync();

  if (entrada != null && entrada2 != null) {
    double peso = double.parse(entrada);
    double altura = double.parse(entrada2);

    double calculoIMC = peso / (altura * altura);

    if (calculoIMC <= 18.5) {
      print('IMC:  ${calculoIMC} ${ABAIXO_PESO}');
      return ABAIXO_PESO;
    } else if (calculoIMC == 18.5 || calculoIMC < 29.99) {
      print('IMC:  ${calculoIMC} ${PESO_IDEAL}');
      return PESO_IDEAL;
    } else {
      print('IMC:  ${calculoIMC} ${OBESO}');
      return OBESO;
    }
  } else {
    print("Entrada invalida");
  }
}

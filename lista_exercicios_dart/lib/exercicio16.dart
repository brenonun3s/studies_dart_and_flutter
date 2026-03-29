import 'dart:io';

//Exercício 16: Números Primos Verifique se um número é primo.

void numeroPrimo() {
  print("Digite um número para verificar se ele é primo:");
  String? entrada = stdin.readLineSync();

  if (entrada != null) {
    int numero = int.parse(entrada);

    if (numero < 2) {
      print("Não é primo");
      return;
    }

    bool primo = true;

    for (int i = 2; i <= numero ~/ 2; i++) { 
      if (numero % i == 0) {
        primo = false;
        break;
      }
    }

    if (primo) {
      print("É primo");
    } else {
      print("Não é primo");
    }
  }
}
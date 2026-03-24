import 'dart:io';

//Exercício 15: Fibonacci Gere os N primeiros termos da sequência de Fibonacci.

void fibonacci() {
  print("Digite um numero para serie de Fibonacci");
  String? entrada = stdin.readLineSync();

  if (entrada != null) {
    int a = 0;
    int b = 1;
    int proximo = 0;
    int numero = int.parse(entrada);

    for (int i = 0; i < numero; i++) {
      if (i == 0) {
        print(a);
      } else if (i == 1) {
        print(b);
      } else {
        proximo = a + b;
        a = b;
        b = proximo;
        print('$proximo');
      }
    }
  }
}

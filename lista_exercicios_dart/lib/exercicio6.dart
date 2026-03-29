import 'dart:io';

//Exercício 6: Maior de Dois Números Leia dois números e exiba o maior deles.


String? compara() {
    print('Digite o primeiro numero: ');
    String? entrada = stdin.readLineSync();
    print('Digite o segundo numero: ');
    String? entrada2 = stdin.readLineSync();

    if (entrada != null && entrada2 != null) {
      int numero1 = int.parse(entrada);
      int numero2 = int.parse(entrada2);

      if (numero1 < numero2) {
        print('Numero $numero1 é menor que $numero2');
      } else if (numero1 == numero2) {
        print('Numero $numero1 é igual a $numero2');
      } else {
        print('Numero $numero1 é maior que $numero2');
      }
    }
}

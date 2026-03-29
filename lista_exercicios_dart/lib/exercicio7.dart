import 'dart:io';

//Exercício 7: Validação de Nota Solicite uma nota (0-10) e valide se o valor é válido, exibindo mensagem de erro caso contrário.


void avaliacao() {
  bool invalido = true;
  while (invalido) {
    try {
      print('Digite uma nota de 0 - 10 : ');

      String? entrada = stdin.readLineSync();
      if (entrada != null) {
        int nota = int.parse(entrada);
        if (nota < 0 || nota > 10) {
          print('Nota invalida');
        } else {
          print('Obrigado por avaliar');
          invalido = false;
        }
      }
    } on FormatException {
      print("Letras nao suportadas, apenas numeros de 0 a 10");
      invalido = true;
    }
  }
}

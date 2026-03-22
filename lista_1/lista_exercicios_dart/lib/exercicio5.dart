import 'dart:io';

String? tabuada() {
  print('Digite o numero que deseja obter a tabuada: ');
  String? entrada = stdin.readLineSync();

  if (entrada != null ) {
    int numero = int.parse(entrada);
    
    for (int i = 0; i <= 10; i++) {
      int multiplicacao = numero * i;
      print('Tabuada $numero x $i: $multiplicacao');
      
    }
  }
}
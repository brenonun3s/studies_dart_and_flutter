import 'dart:io';

//Exercício 13: Substituição em String Leia uma frase, uma palavra para substituir e a nova palavra. Dica: Use o método replaceAll() para substituir todas as ocorrências.

void substituiString() {
  print('Digite sua frase');
  String? frase = stdin.readLineSync();

  print('Digite uma palavra a ser substituida');
    String? substituida = stdin.readLineSync();
    
    print('Digite a nova palavra');
    String? novaPalavra = stdin.readLineSync();


  if (frase != null && substituida != null && novaPalavra != null) {
    String fraseLower = frase.toLowerCase();
    String substituidaLower = substituida.toLowerCase();

    if(fraseLower.contains(substituidaLower)){
      frase = frase.replaceAll(substituida, novaPalavra);
      print('Sua nova frase =  "$frase" ');
    }
    else{
      print('A frase "$frase" não contém a palavra "$substituida"');

    }


  }
}
import 'dart:io';

//Exercício 12: Busca em String Leia uma frase e uma palavra, verifique se a palavra existe na frase. Dica: Use o método contains() para verificar se uma string contém outra.

void buscaString() {
  print('Digite sua frase');
  String? frase = stdin.readLineSync();

  print('Digite uma palavra a ser buscada na frase');
    String? palavra = stdin.readLineSync();


  if (frase != null && palavra != null) {
    frase = frase.toLowerCase();
    palavra = palavra.toLowerCase();
    bool contem = frase.contains(palavra);

    if(contem){
      print('A frase "$frase" contém a palavra "$palavra"');
    }
    else{
      print('A frase "$frase" não contém a palavra "$palavra"');

    }


  }
}
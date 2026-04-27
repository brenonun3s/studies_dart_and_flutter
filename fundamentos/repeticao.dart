void main(List<String> args) {
  for (int i = 0; i < 5; i++) {
    print('Número $i');
  }
  List<String> nomes = ['Ana', 'Bruno', 'Carla'];

  for (int i = 0; i < nomes.length; i++) {
    print('Nomes ${nomes[i]}');
  }
  List<String> frutas = ['Maçã', 'Banana', 'Laranja'];
  for (String fruta in frutas) {
    print('Fruta: $fruta');
  }
  frutas.forEach((fruta) {
    print('Fruta: $fruta');
  });

  int contador = 0;

  while (contador < 5) {
    print('Contador: $contador');
    contador++;
  }

  do {
    print('Contador do-while: $contador');
    contador++;
  } while (contador < 5);
}

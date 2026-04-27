void main(List<String> args) {
  List<int> numeros = [1, 2, 3, 4, 5];
  var frutas = ['Maçã', 'Banana', 'Laranja'];

  print(frutas[0]);
  print(frutas[frutas.length - 1]);

  frutas.add('Uva');
  frutas.addAll(['Melancia', 'Abacaxi']);

  frutas.remove('Banana');
  frutas.removeAt(0);

  print(frutas.contains('Laranja'));
  print(frutas.isEmpty);
  print(frutas.length);

  for (String fruta in frutas) {
    print('Fruta: $fruta');
  }

  numeros.sort();
  numeros.reversed;
  numeros.shuffle();

  Map<String, dynamic> pessoa = {
    'nome': 'Alice',
    'idade': 30,
    'estudante': true,
  };

  var capitais = <String, String>{
    'Brasil': 'Brasília',
    'França': 'Paris',
    'Japão': 'Tóquio',
  };

  print(pessoa['nome']);
  print(capitais['França']);

  pessoa['profissão'] = 'Engenheira';
  pessoa['idade'] = 31;
  pessoa.remove('estudante');

  print(pessoa.containsKey('nome'));
  print(pessoa.containsValue('Engenheira'));
  print(pessoa.keys);
  print(pessoa.values);

  pessoa.forEach((chave, valor) {
    print('$chave: $valor');
  });
}

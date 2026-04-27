import 'Pessoa.dart';

void main(List<String> args) {
  Pessoa pessoa1 = Pessoa('Alice', 30, 65.0, 1.70);
  Pessoa pessoa2 = Pessoa('Bob', 25, 80.0, 1.80);
  Pessoa pessoa3 = Pessoa('Charlie', 40, 90.0, 1.75);

  pessoa1.exibirInformacoes();
  pessoa2.exibirInformacoes();
  pessoa3.exibirInformacoes();

  pessoa1.fazerAniversario();

  print(pessoa1);
  print(pessoa2);
  print(pessoa3);
}

void dizerOla() {
  print('Olá, mundo!');
}

void saudacao(String nome) {
  print('Olá, $nome!');
}

int somar(int a, int b) {
  return a + b;
}

void exibirInfo(String nome, [int? idade]) {
  if (idade != null) {
    print('Nome: $nome, Idade: $idade');
  } else {
    print('Nome: $nome');
  }
}

void cadastrar({required String nome, int idade = 0}) {
  print('Cadastro: Nome: $nome, Idade: $idade');
}

void main(List<String> args) {
  dizerOla();
  saudacao('Alice');
  int resultado = somar(5, 3);
  print('Resultado da soma: $resultado');
  exibirInfo('Bob', 25);
  exibirInfo('Charlie');
  cadastrar(nome: 'Diana', idade: 30);
  cadastrar(nome: 'Breno');
}

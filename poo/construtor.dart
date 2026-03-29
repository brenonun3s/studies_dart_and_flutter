class Pessoa {
  String? nome;
  int idade;
  String? email;

  Pessoa(this.nome, this.idade);

  Pessoa.comEmail(this.nome, this.idade, this.email);

  Pessoa.semIdade(this.nome) : idade = 0;
}

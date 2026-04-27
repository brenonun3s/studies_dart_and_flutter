class Pessoa {
  String nome;
  int idade;
  double peso;
  double altura;

  Pessoa(this.nome, this.idade, this.peso, this.altura);

  void calcularIMC() {
    double imc = peso / (altura * altura);
    print('O IMC de $nome é: ${imc.toStringAsFixed(2)}');
  }

  void classificarIMC() {
    double imc = peso / (altura * altura);
    String classificacao;

    if (imc < 18.5) {
      classificacao = 'Abaixo do peso';
    } else if (imc < 25) {
      classificacao = 'Peso normal';
    } else if (imc < 30) {
      classificacao = 'Sobrepeso';
    } else {
      classificacao = 'Obesidade';
    }

    print('Classificação de $nome: $classificacao');
  }

  void exibirInformacoes() {
    print('Nome: $nome');
    print('Idade: $idade anos');
    print('Peso: ${peso.toStringAsFixed(2)} kg');
    print('Altura: ${altura.toStringAsFixed(2)} m');
  }

  void fazerAniversario() {
    idade++;
    print('Parabéns, $nome! Agora você tem $idade anos.');
  }

  @override
  String toString() {
    return 'Pessoa(nome: $nome, idade: $idade, peso: ${peso.toStringAsFixed(2)}, altura: ${altura.toStringAsFixed(2)})';
  }
}

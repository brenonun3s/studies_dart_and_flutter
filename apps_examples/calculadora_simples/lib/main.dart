import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: CalculadoraSimples()));
}

class CalculadoraSimples extends StatefulWidget {
  @override
  _CalculadoraSimplesState createState() => _CalculadoraSimplesState();
}

class _CalculadoraSimplesState extends State<CalculadoraSimples> {
  String _display = '0';
  double _primeiroNumero = 0;
  String _operacao = '';
  bool _novaEntrada = true;

  void _adicionarNumero(String numero) {
    setState(() {
      if (_novaEntrada) {
        _display = numero;
        _novaEntrada = false;
      } else {
        _display += numero;
      }
    });
  }

  void _definirOperacao(String op) {
    setState(() {
      _primeiroNumero = double.parse(_display);
      _operacao = op;
      _novaEntrada = true;
    });
  }

  void _calcularResultado() {
    setState(() {
      double segundoNumero = double.parse(_display);
      double resultado = 0;

      switch (_operacao) {
        case '+':
          resultado = _primeiroNumero + segundoNumero;
          break;
        case '-':
          resultado = _primeiroNumero - segundoNumero;
          break;
        case '*':
          resultado = _primeiroNumero * segundoNumero;
          break;
        case '/':
          resultado = _primeiroNumero / segundoNumero;
          break;
      }

      _display = resultado.toString();
      _novaEntrada = true;
    });
  }

  void _limpar() {
    setState(() {
      _display = '0';
      _primeiroNumero = 0;
      _operacao = '';
      _novaEntrada = true;
    });
  }

  Widget _botao(String texto, Function() onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(texto, style: TextStyle(fontSize: 20)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calculadora Simples')),
      body: Column(
        children: [
          // DISPLAY
          Container(
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerRight,
            child: Text(_display, style: TextStyle(fontSize: 48)),
          ),

          // BOTÕES
          Expanded(
            child: GridView.count(
              crossAxisCount: 4,
              childAspectRatio: 1.5,
              children: [
                _botao('7', () => _adicionarNumero('7')),
                _botao('8', () => _adicionarNumero('8')),
                _botao('9', () => _adicionarNumero('9')),
                _botao('+', () => _definirOperacao('+')),

                _botao('4', () => _adicionarNumero('4')),
                _botao('5', () => _adicionarNumero('5')),
                _botao('6', () => _adicionarNumero('6')),
                _botao('-', () => _definirOperacao('-')),

                _botao('1', () => _adicionarNumero('1')),
                _botao('2', () => _adicionarNumero('2')),
                _botao('3', () => _adicionarNumero('3')),
                _botao('*', () => _definirOperacao('*')),

                _botao('0', () => _adicionarNumero('0')),
                _botao('C', _limpar),
                _botao('=', _calcularResultado),
                _botao('/', () => _definirOperacao('/')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

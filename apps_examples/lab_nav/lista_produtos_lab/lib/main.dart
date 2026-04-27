import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Produtos',
      debugShowCheckedModeBanner: false,
      home: TelaLista(),
    );
  }
}

// MODELO
class Produto {
  final String nome;
  final double preco;
  final String emoji;

  Produto(this.nome, this.preco, this.emoji);
}

// TELA LISTA
class TelaLista extends StatelessWidget {
  final List<Produto> produtos = [
    Produto('Maçã', 5.99, '🍎'),
    Produto('Banana', 3.49, '🍌'),
    Produto('Laranja', 4.79, '🍊'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Produtos')),
      body: ListView.builder(
        itemCount: produtos.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: ListTile(
              leading: Text(
                produtos[index].emoji,
                style: TextStyle(fontSize: 24),
              ),
              title: Text(produtos[index].nome),
              trailing: Text('R\$ ${produtos[index].preco.toStringAsFixed(2)}'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        TelaDetalhes(produto: produtos[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

// TELA DETALHES
class TelaDetalhes extends StatelessWidget {
  final Produto produto;

  TelaDetalhes({required this.produto});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(produto.nome)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(produto.emoji, style: TextStyle(fontSize: 80)),
            Text(produto.nome, style: TextStyle(fontSize: 32)),
            Text(
              'R\$ ${produto.preco.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 24, color: Colors.green),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text('VOLTAR'),
            ),
          ],
        ),
      ),
    );
  }
}

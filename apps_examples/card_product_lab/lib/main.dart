import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Card de Produto')),
        body: Center(child: CardProduto()),
      ),
    ),
  );
}

class CardProduto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔹 Imagem
          Container(
            height: 150,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: NetworkImage('https://picsum.photos/300/150'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          SizedBox(height: 12),

          // 🔹 Título
          Text(
            'Tênis Esportivo',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          // 🔹 Preço
          Text(
            'R\$ 199,90',
            style: TextStyle(
              fontSize: 20,
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 12),

          // 🔹 Botões
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                child: Text('COMPRAR'),
              ),

              OutlinedButton(onPressed: () {}, child: Text('DETALHES')),
            ],
          ),
        ],
      ),
    );
  }
}

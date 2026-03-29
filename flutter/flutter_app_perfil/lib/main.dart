import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Cartão de Contato'),
          backgroundColor: Colors.blue,
        ),
        body: Center(child: CartaoContato()),
      ),
    ),
  );
}

class CartaoContato extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Avatar
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/breno.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 16),

          // Nome
          Text(
            'Breno Nunes',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),

          // Profissão
          Text(
            'Desenvolvedor Flutter',
            style: TextStyle(fontSize: 16, color: Colors.grey[600]),
          ),

          SizedBox(height: 16),

          // Estatísticas
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildStat('Projetos', '12'),
              _buildStat('Seguidores', '1.5k'),
              _buildStat('Curtidas', '3.2k'),
            ],
          ),

          SizedBox(height: 16),

          // Bio
          Text(
            'Apaixonado por tecnologia e desenvolvimento mobile. Criando apps incríveis com Flutter!',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildStat(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(label, style: TextStyle(color: Colors.grey)),
      ],
    );
  }
}

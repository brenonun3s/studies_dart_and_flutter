import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Dashboard()));
}

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dashboard')),

      body: Padding(
        padding: EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 Título
            Text(
              'Visão Geral',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 16),

            // 🔹 Área dos cards
            Container(
              height: 400,

              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // 🔹 Primeira linha
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // CARD 1
                      _card(
                        Icons.show_chart,
                        Colors.blue,
                        'Vendas',
                        'R\$ 15.2k',
                      ),

                      // CARD 2
                      _card(Icons.people, Colors.orange, 'Clientes', '148'),
                    ],
                  ),

                  SizedBox(height: 16),

                  // 🔹 Segunda linha
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // CARD 3
                      _card(Icons.inventory, Colors.purple, 'Produtos', '42'),

                      // CARD 4
                      _card(Icons.star, Colors.amber, 'Avaliações', '4.8'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🔥 Função para reutilizar card (melhor prática)
  Widget _card(IconData icon, Color color, String titulo, String valor) {
    return Container(
      width: 150,
      height: 150,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 5)],
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: color),

          SizedBox(height: 8),

          Text(titulo, style: TextStyle(fontWeight: FontWeight.bold)),

          SizedBox(height: 4),

          Text(valor, style: TextStyle(fontSize: 18, color: Colors.green)),
        ],
      ),
    );
  }
}

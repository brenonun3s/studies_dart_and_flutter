import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Lab Estatísticas')),
        body: EstatisticasWidget(),
      ),
    ),
  );
}

class EstatisticasWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.grey[100],

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔹 Título
          Text(
            'Estatísticas',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          SizedBox(height: 16),

          // 🔹 Linha com indicadores
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // ITEM 1
              Column(
                children: [
                  Text(
                    '157',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Text('Seguidores', style: TextStyle(color: Colors.grey[600])),
                ],
              ),

              // ITEM 2
              Column(
                children: [
                  Text(
                    '1.2k',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Text('Curtidas', style: TextStyle(color: Colors.grey[600])),
                ],
              ),

              // ITEM 3
              Column(
                children: [
                  Text(
                    '89',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Text('Projetos', style: TextStyle(color: Colors.grey[600])),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

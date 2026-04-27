import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Retorno de Dados',
      debugShowCheckedModeBanner: false,
      home: TelaPrincipal(),
    );
  }
}

// TELA PRINCIPAL
class TelaPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Escolher Plano')),
      body: Center(
        child: ElevatedButton(
          child: Text('Escolher Plano'),
          onPressed: () async {
            final resultado = await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TelaEscolha()),
            );

            if (resultado != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Você escolheu: $resultado')),
              );
            }
          },
        ),
      ),
    );
  }
}

// TELA DE ESCOLHA
class TelaEscolha extends StatelessWidget {
  final List<Map<String, dynamic>> planos = [
    {'nome': 'Básico', 'preco': 29.90, 'cor': Colors.green},
    {'nome': 'Pro', 'preco': 59.90, 'cor': Colors.blue},
    {'nome': 'Premium', 'preco': 99.90, 'cor': Colors.purple},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Selecione um Plano')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: planos.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: ListTile(
                    leading: Icon(
                      Icons.check_circle,
                      color: planos[index]['cor'],
                    ),
                    title: Text('Plano ${planos[index]['nome']}'),
                    trailing: Text(
                      'R\$ ${planos[index]['preco'].toStringAsFixed(2)}',
                    ),
                    onTap: () {
                      Navigator.pop(context, planos[index]['nome']);
                    },
                  ),
                );
              },
            ),
          ),

          // BOTÃO CANCELAR
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              child: Text('Cancelar'),
              onPressed: () => Navigator.pop(context, null),
            ),
          ),
        ],
      ),
    );
  }
}

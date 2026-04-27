import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navegação Simples',
      debugShowCheckedModeBanner: false,
      home: Tela1(),
    );
  }
}

// TELA 1
class Tela1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tela 1')),
      body: Center(
        child: ElevatedButton(
          child: Text('IR PARA TELA 2'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Tela2()),
            );
          },
        ),
      ),
    );
  }
}

// TELA 2
class Tela2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tela 2')),
      body: Center(
        child: ElevatedButton(
          child: Text('VOLTAR'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}

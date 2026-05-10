import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('ScaffoldMessenger Demo')),
        body: Builder(
          builder: (context) {
            return Center(
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Mensagem exibida com sucesso!')),
                  );
                },
                child: Text('Mostrar Mensagem'),
              ),
            );
          },
        ),
      ),
    );
  }
}

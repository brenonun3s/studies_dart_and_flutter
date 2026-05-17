import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Dialogs Demo',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: const DialogDemoScreen(),
    );
  }
}

class DialogDemoScreen extends StatelessWidget {
  const DialogDemoScreen({super.key});

  // Função para exibir um AlertDialog
  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // Impede fechar ao clicar fora
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmação'),
          content: const Text('Deseja excluir este item?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop(); // Fecha o diálogo
              },
            ),
            TextButton(
              child: const Text('Excluir'),
              onPressed: () {
                Navigator.of(context).pop(); // Fecha o diálogo
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text('Item excluído!')));
              },
            ),
          ],
        );
      },
    );
  }

  // Função para exibir um SimpleDialog
  void _showSimpleDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Escolha uma opção'),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () {
                Navigator.of(context).pop('Opção 1');
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Selecionado: Opção 1')),
                );
              },
              child: const Text('Opção 1'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.of(context).pop('Opção 2');
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Selecionado: Opção 2')),
                );
              },
              child: const Text('Opção 2'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.of(context).pop('Opção 3');
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Selecionado: Opção 3')),
                );
              },
              child: const Text('Opção 3'),
            ),
          ],
        );
      },
    );
  }

  // Função para exibir um Custom Dialog
  void _showCustomDialog(BuildContext context) {
    final TextEditingController _controller = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Formulário Personalizado',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    labelText: 'Digite seu nome',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Fecha o diálogo
                      },
                      child: const Text('Cancelar'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_controller.text.isNotEmpty) {
                          Navigator.of(context).pop(_controller.text);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Nome enviado: ${_controller.text}',
                              ),
                            ),
                          );
                        }
                      },
                      child: const Text('Enviar'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Dialogs Demo')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => _showAlertDialog(context),
              child: const Text('Mostrar AlertDialog'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _showSimpleDialog(context),
              child: const Text('Mostrar SimpleDialog'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _showCustomDialog(context),
              child: const Text('Mostrar Custom Dialog'),
            ),
          ],
        ),
      ),
    );
  }
}

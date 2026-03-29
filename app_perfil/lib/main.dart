import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: TelaPrincipal()));
}

// ========== TELA PRINCIPAL ==========
class TelaPrincipal extends StatefulWidget {
  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  String _nome = 'Breno Nunes';
  int _idade = 24;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Meu Perfil')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // TODO: Exibir nome e idade
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Editar Perfil'),
              onPressed: () async {
                // TODO: Navegar para tela de edição e aguardar resultado
              },
            ),
          ],
        ),
      ),
    );
  }
}

// ========== TELA DE EDIÇÃO ==========
class TelaEdicao extends StatefulWidget {
  final String nome;
  final int idade;
  TelaEdicao({required this.nome, required this.idade});
  @override
  _TelaEdicaoState createState() => _TelaEdicaoState();
}

class _TelaEdicaoState extends State<TelaEdicao> {
  late TextEditingController _nomeController;
  late TextEditingController _idadeController;
  @override
  void initState() {
    super.initState();

    _nomeController = TextEditingController(text: widget.nome);
    _idadeController = TextEditingController(text: widget.idade.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Editar Perfil')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // TODO: Adicionar campos de texto
            TextField(
              controller: _nomeController,
              decoration: InputDecoration(labelText: 'Nome'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _idadeController,
              decoration: InputDecoration(labelText: 'Idade'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Salvar'),
              onPressed: () {
                // TODO: Retornar dados editados
              },
            ),
          ],
        ),
      ),
    );
  }
}

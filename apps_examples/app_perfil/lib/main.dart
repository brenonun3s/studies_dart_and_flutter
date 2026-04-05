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
      appBar: AppBar(title: const Text('Meu Perfil')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Nome: $_nome'),
            Text('Idade: $_idade'),

            const SizedBox(height: 20),

            ElevatedButton(
              child: const Text('Editar Perfil'),
              onPressed: () async {
                final resultado = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        TelaEdicao(nome: _nome, idade: _idade),
                  ),
                );

                if (resultado != null) {
                  setState(() {
                    _nome = resultado['nome'];
                    _idade = resultado['idade'];
                  });
                }
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

  const TelaEdicao({Key? key, required this.nome, required this.idade})
    : super(key: key);

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
  void dispose() {
    _nomeController.dispose();
    _idadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Editar Perfil')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _nomeController,
              decoration: const InputDecoration(labelText: 'Nome'),
            ),
            TextField(
              controller: _idadeController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Idade'),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              child: const Text('Salvar'),
              onPressed: () {
                final novoNome = _nomeController.text;
                final novaIdade = int.tryParse(_idadeController.text) ?? 0;

                Navigator.pop(context, {'nome': novoNome, 'idade': novaIdade});
              },
            ),
          ],
        ),
      ),
    );
  }
}

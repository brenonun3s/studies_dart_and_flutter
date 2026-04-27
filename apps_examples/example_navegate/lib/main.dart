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
  String _nome = 'João Silva';
  int _idade = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Meu Perfil')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ✅ Exibir nome e idade
            Text('Nome: $_nome', style: TextStyle(fontSize: 18)),
            Text('Idade: $_idade', style: TextStyle(fontSize: 18)),

            SizedBox(height: 20),

            ElevatedButton(
              child: Text('Editar Perfil'),
              onPressed: () async {
                // ✅ Navegar e aguardar retorno
                final resultado = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => TelaEdicao(nome: _nome, idade: _idade),
                  ),
                );

                // ✅ Atualizar dados ao voltar
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
            // ✅ Campos de texto
            TextField(
              controller: _nomeController,
              decoration: InputDecoration(labelText: 'Nome'),
            ),

            TextField(
              controller: _idadeController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Idade'),
            ),

            SizedBox(height: 20),

            ElevatedButton(
              child: Text('Salvar'),
              onPressed: () {
                // ✅ Retornar dados
                Navigator.pop(context, {
                  'nome': _nomeController.text,
                  'idade': int.tryParse(_idadeController.text) ?? 0,
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

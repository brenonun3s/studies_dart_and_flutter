import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rotas Nomeadas',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => TelaPerfil(),
        '/sobre': (context) => TelaSobre(),
        '/contato': (context) => TelaContato(),
        '/endereco': (context) => TelaEndereco(),
      },
    );
  }
}

// TELA PERFIL
class TelaPerfil extends StatelessWidget {
  final Map<String, dynamic> usuario = {
    'nome': 'João Silva',
    'idade': 30,
    'profissao': 'Desenvolvedor Flutter',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Perfil')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(radius: 50, child: Icon(Icons.person, size: 50)),
          SizedBox(height: 16),
          Text(
            usuario['nome'],
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text('${usuario['idade']} anos', style: TextStyle(fontSize: 18)),
          SizedBox(height: 30),

          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  child: Text('Sobre'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/sobre', arguments: usuario);
                  },
                ),
                ElevatedButton(
                  child: Text('Contato'),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/contato',
                      arguments: usuario,
                    );
                  },
                ),
                ElevatedButton(
                  child: Text('Endereço'),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/endereco',
                      arguments: usuario,
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// TELA SOBRE
class TelaSobre extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuario =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(title: Text('Sobre')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Profissão:'),
            Text(usuario['profissao'], style: TextStyle(fontSize: 20)),
            SizedBox(height: 30),
            ElevatedButton(
              child: Text('VOLTAR'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}

// TELA CONTATO
class TelaContato extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuario =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(title: Text('Contato')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Nome: ${usuario['nome']}'),
            Text('Idade: ${usuario['idade']}'),
            SizedBox(height: 30),
            ElevatedButton(
              child: Text('VOLTAR'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}

// TELA ENDEREÇO
class TelaEndereco extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuario =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(title: Text('Endereço')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Endereço não cadastrado'),
            SizedBox(height: 30),
            ElevatedButton(
              child: Text('VOLTAR'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}

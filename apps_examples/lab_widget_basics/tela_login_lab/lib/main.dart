import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: TelaLogin()));
}

class TelaLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 350,
          padding: EdgeInsets.all(24),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 🔹 Ícone
              Icon(Icons.person, size: 80, color: Colors.blue),

              SizedBox(height: 32),

              // 🔹 Campo email
              TextField(
                decoration: InputDecoration(
                  labelText: 'E-mail',
                  border: OutlineInputBorder(),
                ),
              ),

              SizedBox(height: 16),

              // 🔹 Campo senha
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  border: OutlineInputBorder(),
                ),
              ),

              SizedBox(height: 24),

              // 🔹 Botão entrar
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text('ENTRAR'),
              ),

              SizedBox(height: 16),

              // 🔹 Esqueceu senha
              TextButton(onPressed: () {}, child: Text('Esqueceu a senha?')),

              SizedBox(height: 8),

              // 🔹 Row com ações
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(onPressed: () {}, child: Text('Criar conta')),
                  TextButton(onPressed: () {}, child: Text('Ajuda')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

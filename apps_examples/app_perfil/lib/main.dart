import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Cartão de Contato - TI'),
          backgroundColor: Colors.blue,
        ),
        body: const Center(child: CartaoContato()),
      ),
    ),
  );
}

class CartaoContato extends StatelessWidget {
  const CartaoContato({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 🔹 Row com foto e dados principais
          Row(
            children: [
              const CircleAvatar(
                radius: 30,
                child: Icon(Icons.person, size: 30),
              ),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Breno Nunes',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text('Analista de Sistemas'),
                ],
              ),
            ],
          ),

          const SizedBox(height: 20),

          // 🔹 Row com ícones de contato
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Icon(Icons.phone, color: Colors.green),
              Icon(Icons.email, color: Colors.red),
              Icon(Icons.link, color: Colors.blue),
            ],
          ),

          const SizedBox(height: 20),

          // 🔹 Row com botões
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: () {}, child: const Text('Ligar')),
              ElevatedButton(onPressed: () {}, child: const Text('Email')),
            ],
          ),
        ],
      ),
    );
  }
}

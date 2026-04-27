import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Stack com Badge')),
        body: BadgeNotificacao(),
      ),
    ),
  );
}

class BadgeNotificacao extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: AlignmentDirectional.topEnd,
            children: [
              // 🔹 Ícone (base)
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    Icons.notifications,
                    size: 40,
                    color: Colors.grey[700],
                  ),
                ),
              ),

              // 🔹 Badge
              Container(
                width: 30,
                height: 30,
                margin: EdgeInsets.only(right: 5, top: 5),
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: Center(
                  child: Text(
                    '3',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 20),

          // 🔹 Texto opcional
          Text(
            'Stack com badge de notificação',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class MapBook extends StatelessWidget {
  final Map<String, dynamic> book;

  const MapBook({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MachBook'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // vertical
          crossAxisAlignment: CrossAxisAlignment.center, // horizontal
          children: [
            Icon(
              book['icono'],size: 120,color: Colors.brown[400],
            ),
            const SizedBox(height: 8),
            Text(
              book['titulo'],
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

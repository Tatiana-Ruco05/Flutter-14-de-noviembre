import 'package:flutter/material.dart';

class DetalleLibro extends StatelessWidget {
  final Map<String, dynamic> libro;

  const DetalleLibro({super.key, required this.libro});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(libro['titulo']),
        backgroundColor: Colors.green[400],
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Centra verticalmente
            crossAxisAlignment:
                CrossAxisAlignment.center, // Centra horizontalmente
            children: [
              Icon(libro['icono'], size: 80, color: Colors.green),
              const SizedBox(height: 20),
              Text(
                libro['titulo'],
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                'Autor: ${libro['autor']}',
                style: const TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[400],
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
                label: const Text('Regresar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

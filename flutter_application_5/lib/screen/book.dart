import 'package:flutter/material.dart';
import 'package:flutter_application_5/screen/FirstPage.dart';

class Book extends StatefulWidget {
  const Book({super.key});

  @override
  State<Book> createState() => _BookState();
}

class _BookState extends State<Book> {
  
  // Ejemplo de lista (debes tener algo parecido)
  final List<Map<String, dynamic>> libros = [
    {
      'titulo': 'Cien años de soledad',
      'autor': 'Gabriel García Márquez',
      'icono': Icons.book,
    },
    {
      'titulo': 'El Principito',
      'autor': 'Antoine de Saint-Exupéry',
      'icono': Icons.menu_book,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Libros solicitados'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: libros.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Icon(libros[index]['icono']),
            title: Text(libros[index]['titulo']),
            subtitle: Text(libros[index]['autor']),
          );
        },
      ),
    );
  }
}

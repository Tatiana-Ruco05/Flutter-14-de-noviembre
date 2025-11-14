import 'package:flutter/material.dart';
import 'package:flutter_application_5/screen/DetalleLibro.dart';
import 'package:flutter_application_5/screen/book.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              const Image(
                image: NetworkImage('https://picsum.photos/330/200'),
              ),
              const SizedBox(height: 8),

              ListTile(
                leading: const Icon(Icons.home),
                trailing: const Icon(Icons.arrow_circle_right),
                title: const Text('Inicio'),
              ),

              const SizedBox(height: 8),

              ListTile(
                leading: const Icon(Icons.category),
                trailing: const Icon(Icons.arrow_circle_right),
                title: const Text('Categoria'),
              ),

              const SizedBox(height: 8),

              ListTile(
                leading: const Icon(Icons.book),
                trailing: const Icon(Icons.arrow_circle_right),
                title: const Text('Mis Libros'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Book()),
                  );
                },
              ),

              const SizedBox(height: 8),

              ListTile(
                leading: const Icon(Icons.person_2),
                trailing: const Icon(Icons.arrow_circle_right),
                title: const Text('Mi perfil'),
              ),
            ],
          ),
        ),
      ),

      appBar: AppBar(
        title: const Text('Biblioteca Escolar'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),

      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text('Hola', style: TextStyle(fontSize: 20)),
          ),

          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: libros.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(8),
            itemBuilder: (BuildContext context, int i) {
              return Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetalleLibro(libro: libros[i]),
                      ),
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(libros[i]['icono'], size: 30, color: Colors.green),
                      const SizedBox(height: 4),
                      Text(
                        libros[i]['titulo'],
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

///// LISTA DE LIBROS
final List<Map<String, dynamic>> libros = [
  {
    'id': '1',
    'titulo': 'Cien años de soledad',
    'autor': 'Gabriel Garcia Marquez',
    'icono': Icons.book,
  },
  {
    'id': '2',
    'titulo': 'El Principito',
    'autor': 'Antoine de Saint',
    'icono': Icons.book,
  },
  {
    'id': '3',
    'titulo': 'La Odisea',
    'autor': 'Homero',
    'icono': Icons.book,
  },
  {
    'id': '4',
    'titulo': 'Don Quijote',
    'autor': 'Miguel de Cervantes',
    'icono': Icons.book,
  },
  {
    'id': '5',
    'titulo': '1984',
    'autor': 'George Orwell',
    'icono': Icons.book,
  },
  {
    'id': '6',
    'titulo': 'La María',
    'autor': 'Jorge Isaacs',
    'icono': Icons.book,
  },
];

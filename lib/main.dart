import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const FirsApp());
}

class FirsApp extends StatefulWidget {
  const FirsApp({super.key});

  @override
  State<FirsApp> createState() => _FirsAppState();
}

class _FirsAppState extends State<FirsApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Almacenes Agropecuarios del Cauca',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange[300],
          foregroundColor: Colors.white,
          title: const Text('Almacenes Cauca'),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              ListTile(
                title: const Text('Home'),
                subtitle: const Text('Panel usuario'),
                trailing: const Icon(Icons.arrow_circle_right),
                leading: const Icon(Icons.home),
                onTap: () {
                  print('Usted presionó Home');
                },
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print("Botón flotante presionado");
          },
          child: const Icon(Icons.add_circle_outline_sharp),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.phone_android_sharp), label: 'Phone'),
            BottomNavigationBarItem(icon: Icon(Icons.settings_accessibility_sharp), label: 'Configuración'),
          ],
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: const [
                Text('Todo para el campo'),
                Text('Todo para el campo'),
                Text('Todo para el campo'),
                Text('Todo para el campo'),
                Text('Todo para el campo'),
                Text('Todo para el campo'),
                Text('Todo para el campo'),
                Text('Todo para el campo'),
                Text('Todo para el campo'),
                Text('Todo para el campo'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

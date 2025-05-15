import 'package:flutter/material.dart';

class OpcionesMenuScreen extends StatelessWidget {
  const OpcionesMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Opciones'),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          ListTile(
            leading: Icon(Icons.lock),
            title: Text('Seguridad'),
            subtitle: Text('Ajustes de seguridad'),
          ),
          ListTile(
            leading: Icon(Icons.backup),
            title: Text('Respaldo'),
            subtitle: Text('Copias automáticas de seguridad'),
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notificaciones'),
            subtitle: Text('Configuración de alertas'),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Perfil'),
            subtitle: Text('Datos personales'),
          ),
          ListTile(
            leading: Icon(Icons.language),
            title: Text('Idioma'),
            subtitle: Text('Seleccionar idioma preferido'),
          ),
          ListTile(
            leading: Icon(Icons.help_outline),
            title: Text('Ayuda'),
            subtitle: Text('Centro de soporte'),
          ),
        ],
      ),
    );
  }
}

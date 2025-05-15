import 'package:flutter/material.dart';

class PerfilScreen extends StatelessWidget {
  const PerfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView(
        children: const [
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Mi cuenta'),
            subtitle: Text('Administra tu perfil de usuario'),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Configuración'),
            subtitle: Text('Preferencias generales'),
          ),
          ListTile(
            leading: Icon(Icons.security),
            title: Text('Seguridad'),
            subtitle: Text('Cambiar contraseña o agregar seguridad'),
          ),
          ListTile(
            leading: Icon(Icons.lock),
            title: Text('Privacidad'),
            subtitle: Text('Permisos y datos'),
          ),
          ListTile(
            leading: Icon(Icons.language),
            title: Text('Idioma'),
            subtitle: Text('Seleccionar idioma de la app'),
          ),
          ListTile(
            leading: Icon(Icons.group),
            title: Text('Usuarios compartidos'),
            subtitle: Text('Gestionar acceso de otros usuarios'),
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notificaciones'),
            subtitle: Text('Preferencias de alertas'),
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('Acerca de'),
            subtitle: Text('Versión y detalles de la aplicación'),
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Cerrar sesión'),
            subtitle: Text('Salir de tu cuenta'),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pdf_csv_generator/screen/menu/options_menu.dart';
import 'package:pdf_csv_generator/screen/person/option_account.dart';
import 'package:pdf_csv_generator/widgets/decorative_tile.dart';

import 'package:pdf_csv_generator/widgets/documents_bottoms.dart';
import 'package:pdf_csv_generator/widgets/icons_short_cut.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController controller = PageController(viewportFraction: 1.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder:
                (_) => AlertDialog(
                  title: const Text('¿Qué es un Isolate?'),
                  content: const Text(
                    'En Flutter, un Isolate es una forma de ejecutar código en paralelo sin bloquear la interfaz de usuario.\n\n'
                    'Son ideales para tareas pesadas como generar archivos, procesar imágenes o cálculos complejos.\n\n'
                    'Usar Isolates permite que la app siga siendo fluida mientras se realiza el trabajo en segundo plano.',
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cerrar'),
                    ),
                  ],
                ),
          );
        },
        tooltip: '¿Qué es un Isolate?',
        child: const Icon(Icons.info_outline),
      ),
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text('Generador de Documentos'),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(10),
          child: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const OpcionesMenuScreen()),
              );
            },
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: IconButton(
              icon: const Icon(Icons.person_2),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const PerfilScreen()),
                );
              },
            ),
          ),
        ],
      ),
      backgroundColor: Colors.grey.shade200,
      body: Padding(
        padding: const EdgeInsets.all(24.0),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Explora tu generador",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 180,
              child: PageView(
                controller: controller,
                children: [
                  DecorativeTile(
                    bgColor: Colors.green.shade100,
                    imagePath: 'lib/imagenesis/documents.png',
                    title: 'Documentos',
                    description:
                        'Un ejemplo claro de el uso de Isolates es la generación de documentos.',
                  ),
                  DecorativeTile(
                    bgColor: Colors.indigo.shade100,
                    imagePath: 'lib/imagenesis/fast.png',
                    title: 'Rápido',
                    description:
                        'Gracias a que la UI no se bloquea, la generación de documentos es rápida y eficiente.',
                  ),
                  DecorativeTile(
                    bgColor: Colors.cyan.shade100,
                    imagePath: 'lib/imagenesis/optimization.png',
                    title: 'Optimizado',
                    description:
                        'El uso de Isolates permite optimizar el rendimiento de la app, al separar procesos.',
                  ),
                  DecorativeTile(
                    bgColor: Colors.deepOrange.shade100,
                    imagePath: 'lib/imagenesis/arrow.png',
                    title: 'Paralelo',
                    description:
                        'Los Isolates permiten ejecutar tareas en paralelo, sin afectar el hilo principal de la app.',
                  ),
                  DecorativeTile(
                    bgColor: Colors.lightBlue.shade100,
                    imagePath: 'lib/imagenesis/flutter.png',
                    title: 'Flutter',
                    description:
                        'Al igual que en otros lenguajes en flutter también existen los Isolates, por ejemplo en Java se le conoce como hilos.',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Center(
              child: SmoothPageIndicator(
                controller: controller,
                count: 5,
                effect: WormEffect(
                  dotHeight: 10,
                  dotWidth: 10,
                  activeDotColor: Colors.blueAccent,
                  dotColor: Colors.grey.shade400,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconShortcut(icon: Icons.document_scanner, label: 'Escanear'),
                IconShortcut(icon: Icons.folder, label: 'Mis archivos'),
                IconShortcut(icon: Icons.settings, label: 'Ajustes'),
              ],
            ),
            const SizedBox(height: 24),

            const DocumentButton(),

            const SizedBox(height: 12),
            const Center(
              child: Text(
                "Flutter + Isolates + Rendimiento",
                style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

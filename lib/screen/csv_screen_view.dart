import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:pdf_csv_generator/services/csv_generator.dart';
import 'package:pdf_csv_generator/widgets/progress_dialog.dart';
import 'package:share_plus/share_plus.dart';

class ViewCsvScreen extends StatefulWidget {
  const ViewCsvScreen({super.key});

  @override
  State<ViewCsvScreen> createState() => _ViewCsvScreenState();
}

class _ViewCsvScreenState extends State<ViewCsvScreen> {
  String? filePath;
  String status = "Esperando...";
  bool isGenerating = false;

  void _generateCsv() async {
    setState(() {
      isGenerating = true;
      status = "Generando CSV...";
    });

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const ProgressDialog(),
    );

    final path = await generateCsvFileUsingIsolate();
    Navigator.pop(context);

    setState(() {
      filePath = path;
      status = "CSV generado correctamente.";
      isGenerating = false;
    });
  }

  void _openFile() {
    if (filePath != null) OpenFile.open(filePath!);
  }

  void _shareFile() async {
    if (filePath != null) {
      await Share.shareXFiles([
        XFile(filePath!, mimeType: 'text/csv'),
      ], text: 'Documento CSV generado');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Documento CSV"),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.grey.shade200,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: isGenerating ? null : _generateCsv,
                icon: const Icon(Icons.insert_drive_file),
                label: const Text("Generar CSV"),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(250, 60),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: filePath == null ? null : _openFile,
                icon: const Icon(Icons.open_in_new),
                label: const Text("Abrir CSV"),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(250, 60),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: filePath == null ? null : _shareFile,
                icon: const Icon(Icons.share),
                label: const Text("Compartir CSV"),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(250, 60),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                status,
                style: const TextStyle(fontStyle: FontStyle.italic),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

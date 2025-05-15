import 'package:flutter/material.dart';

import 'package:open_file/open_file.dart';
import 'package:pdf_csv_generator/services/txt_fenerator.dart';
import 'package:pdf_csv_generator/widgets/progress_dialog.dart';
import 'package:share_plus/share_plus.dart';

class ViewTxtScreen extends StatefulWidget {
  const ViewTxtScreen({super.key});

  @override
  State<ViewTxtScreen> createState() => _ViewTxtScreenState();
}

class _ViewTxtScreenState extends State<ViewTxtScreen> {
  String? filePath;
  String status = "Esperando...";
  bool isGenerating = false;

  void _generateTxt() async {
    setState(() {
      isGenerating = true;
      status = "Generando TXT...";
    });

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const ProgressDialog(),
    );

    final path = await generateTxtFileUsingIsolate();
    Navigator.pop(context);

    setState(() {
      filePath = path;
      status = "TXT generado correctamente.";
      isGenerating = false;
    });
  }

  void _openFile() {
    if (filePath != null) OpenFile.open(filePath!);
  }

  void _shareFile() async {
    if (filePath != null) {
      await Share.shareXFiles([
        XFile(filePath!, mimeType: 'text/plain'),
      ], text: 'Documento TXT generado');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Documento TXT"),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.grey.shade200,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: ElevatedButton.icon(
                onPressed: isGenerating ? null : _generateTxt,
                icon: const Icon(Icons.text_snippet),
                label: const Text("Generar TXT"),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: filePath == null ? null : _openFile,
              icon: const Icon(Icons.open_in_new),
              label: const Text("Abrir TXT"),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: filePath == null ? null : _shareFile,
              icon: const Icon(Icons.share),
              label: const Text("Compartir TXT"),
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
    );
  }
}

import 'package:flutter/material.dart';

import 'package:open_file/open_file.dart';
import 'package:pdf_csv_generator/services/pdf_generator.dart';
import 'package:pdf_csv_generator/widgets/progress_dialog.dart';
import 'package:share_plus/share_plus.dart';

class ViewPdfScreen extends StatefulWidget {
  const ViewPdfScreen({super.key});

  @override
  State<ViewPdfScreen> createState() => _ViewPdfScreenState();
}

class _ViewPdfScreenState extends State<ViewPdfScreen> {
  String? filePath;
  String status = "Esperando...";
  bool isGenerating = false;

  void _generatePdf() async {
    setState(() {
      isGenerating = true;
      status = "Generando PDF...";
    });

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const ProgressDialog(),
    );

    final path = await generatePdfFileUsingIsolate();
    Navigator.pop(context);

    setState(() {
      filePath = path;
      status = "PDF generado correctamente.";
      isGenerating = false;
    });
  }

  void _openFile() {
    if (filePath != null) OpenFile.open(filePath!);
  }

  void _shareFile() async {
    if (filePath != null) {
      await Share.shareXFiles([
        XFile(filePath!, mimeType: 'application/pdf'),
      ], text: 'Documento PDF generado');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Documento PDF"),
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
                onPressed: isGenerating ? null : _generatePdf,
                icon: const Icon(Icons.picture_as_pdf),
                label: const Text("Generar PDF"),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: filePath == null ? null : _openFile,
              icon: const Icon(Icons.open_in_new),
              label: const Text("Abrir PDF"),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: filePath == null ? null : _shareFile,
              icon: const Icon(Icons.share),
              label: const Text("Compartir PDF"),
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

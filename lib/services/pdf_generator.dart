import 'dart:io';
import 'dart:isolate';

import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

Future<String> generatePdfFileUsingIsolate() async {
  final directory = await getApplicationDocumentsDirectory();
  final outputPath = '${directory.path}/usuarios.pdf';

  final receivePort = ReceivePort();
  await Isolate.spawn(_pdfWorker, [receivePort.sendPort, outputPath]);

  return await receivePort.first as String;
}

void _pdfWorker(List<dynamic> args) async {
  final SendPort sendPort = args[0];
  final String path = args[1];

  final pdf = pw.Document();

  List<List<String>> data = [
    ["ID", "Nombre", "Correo"],
  ];

  for (int i = 0; i < 700; i++) {
    data.add(["$i", "Usuario_$i", "user$i@example.com"]);
  }

  pdf.addPage(
    pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      build:
          (pw.Context context) => [
            pw.Text('Lista de Usuarios', style: pw.TextStyle(fontSize: 18)),
            pw.SizedBox(height: 20),
            // ignore: deprecated_member_use
            pw.Table.fromTextArray(
              context: context,
              data: data,
              cellAlignment: pw.Alignment.centerLeft,
              headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
              cellStyle: const pw.TextStyle(fontSize: 8),
            ),
          ],
    ),
  );

  final file = File(path);
  await file.writeAsBytes(await pdf.save());

  sendPort.send(path);
}

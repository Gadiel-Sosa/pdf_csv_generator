import 'dart:io';
import 'dart:isolate';
import 'package:csv/csv.dart';
import 'package:path_provider/path_provider.dart';

Future<String> generateCsvFileUsingIsolate() async {
  // Ruta segura y sin necesidad de permisos
  final directory = await getApplicationDocumentsDirectory();
  final outputPath = '${directory.path}/usuarios.csv';

  final receivePort = ReceivePort();
  await Isolate.spawn(_csvWorker, [receivePort.sendPort, outputPath]);

  return await receivePort.first as String;
}

void _csvWorker(List<dynamic> args) async {
  final SendPort sendPort = args[0];
  final String path = args[1];

  List<List<String>> data = [
    ["ID", "Nombre", "Correo"],
  ];

  for (int i = 0; i < 1000; i++) {
    data.add(["$i", "Usuario_$i", "user$i@example.com"]);
  }

  String csv = const ListToCsvConverter().convert(data);

  final file = File(path);
  await file.writeAsString(csv);

  sendPort.send(path);
}

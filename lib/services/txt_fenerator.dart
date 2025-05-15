import 'dart:io';
import 'dart:isolate';
import 'package:path_provider/path_provider.dart';

Future<String> generateTxtFileUsingIsolate() async {
  final directory = await getApplicationDocumentsDirectory();
  final outputPath = '${directory.path}/usuarios.txt';

  final receivePort = ReceivePort();
  await Isolate.spawn(_txtWorker, [receivePort.sendPort, outputPath]);

  return await receivePort.first as String;
}

void _txtWorker(List<dynamic> args) async {
  final SendPort sendPort = args[0];
  final String path = args[1];

  final buffer = StringBuffer();
  buffer.writeln("ID\tNombre\tCorreo");

  for (int i = 0; i < 1000; i++) {
    buffer.writeln("$i\tUsuario_$i\tuser$i@example.com");
  }

  final file = File(path);
  await file.writeAsString(buffer.toString());

  sendPort.send(path);
}

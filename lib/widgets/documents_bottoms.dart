import 'package:flutter/material.dart';
import 'package:pdf_csv_generator/screen/csv_screen_view.dart';
import 'package:pdf_csv_generator/screen/pdf_screen_view.dart';
import 'package:pdf_csv_generator/screen/txt_screen_view.dart';

class DocumentButton extends StatelessWidget {
  const DocumentButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton.icon(
            icon: const Icon(Icons.picture_as_pdf),
            label: const Text("Documento PDF"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ViewPdfScreen()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              minimumSize: const Size.fromHeight(60),
            ),
          ),
          ElevatedButton.icon(
            icon: const Icon(Icons.insert_drive_file),
            label: const Text("Documento CSV"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ViewCsvScreen()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              minimumSize: const Size.fromHeight(60),
            ),
          ),
          ElevatedButton.icon(
            icon: const Icon(Icons.text_snippet),
            label: const Text("Documento TXT"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ViewTxtScreen()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              minimumSize: const Size.fromHeight(60),
            ),
          ),
        ],
      ),
    );
  }
}

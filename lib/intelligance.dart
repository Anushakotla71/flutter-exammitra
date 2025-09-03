import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Intelligance extends StatelessWidget {
  const Intelligance({super.key});

  final List<Map<String, String>> papers = const [
    {
      "title": "General Intelligance & Reasoning for SSC CGL",
      "pdfUrl":
          "https://blogmedia.testbook.com/blog/wp-content/uploads/2022/03/best-4000-smart-question-bank-ssc-general-intelligence-and-reasoning-in-english-next-generation-smartbook-by-testbook-and-s-chand-bce87475.pdf",
    },
  ];

  Future<void> _launchPDF(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("General Intelligance & Reasoning for SSC CGL"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Row(
            children: [
              Image.asset('assets/images/girimage.jpg', height: 70),
              const SizedBox(width: 10),
              const Expanded(
                child: Text(
                  'General Intelligance & Reasoning for SSC CGL',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ...papers.asMap().entries.map((entry) {
            int index = entry.key + 1;
            var paper = entry.value;
            return Card(
              elevation: 2,
              margin: const EdgeInsets.symmetric(vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.all(16),
                onTap: () => _launchPDF(paper['pdfUrl']!),
                title: Text(
                  "${index.toString().padLeft(2, '0')}. ${paper['title']}",
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                trailing: const Icon(Icons.picture_as_pdf, color: Colors.red),
              ),
            );
          }),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Previous extends StatelessWidget {
  const Previous({super.key});

  final List<Map<String, String>> papers = const [
    {
      "title": "SSC CGL Previous Papers",
      "pdfUrl":
          "https://www.careerpower.in/blog/wp-content/uploads/2024/10/18135503/SSC-CGL-Tier-1-Question-Paper-12-September-2024-Shift-1.pdf",
    },
    {
      "title": "SSC CGL Previous Papers",
      "pdfUrl":
          "https://www.adda247.com/jobs/wp-content/uploads/2021/05/11093256/6_march_shift_1.pdf",
    },
    {
      "title": "SSC CGL Previous Papers",
      "pdfUrl":
          "https://www.adda247.com/jobs/wp-content/uploads/2021/05/11093322/3_march_shift_1.pdf",
    },
    {
      "title": "SSC CGL Previous Papers",
      "pdfUrl":
          "https://www.adda247.com/jobs/wp-content/uploads/2021/05/11093244/7_march_shift_1.pdf",
    },
    {
      "title": "SSC CGL Previous Papers",
      "pdfUrl":
          "https://www.adda247.com/jobs/wp-content/uploads/2021/05/11093310/4_march_shift_1.pdf",
    },
    {
      "title": "SSC CGL Full Length Papers",
      "pdfUrl":
          "https://www.careerpower.in/ssc-cgl-previous-year-question-paper.html",
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
        title: const Text("SSC CGL Previous Year Papers"),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Row(
            children: [
              Image.asset('assets/images/pypaperimage.png', height: 70),
              const SizedBox(width: 10),
              const Expanded(
                child: Text(
                  'SSC CGL Previous Year Papers',
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

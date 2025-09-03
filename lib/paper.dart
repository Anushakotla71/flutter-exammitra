import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: Paper()));
}

class Paper extends StatelessWidget {
  const Paper({super.key});

  final List<Map<String, String>> papers = const [
    {
      "title": "SSC CGL Previous Papers",
      "pdfUrl":
          "https://www.careerpower.in/blog/wp-content/uploads/2024/06/24150055/SSC_CGL_2023_Tier_1_14th-July-2023-Shift-2.pdf",
    },
    {
      "title": "SSC CGL Previous Papers",
      "pdfUrl":
          "https://www.careerpower.in/blog/wp-content/uploads/2024/06/24150546/SSC_CGL_2023_Tier_1_18th-July-2023-Shift-1.pdf",
    },
    {
      "title": "SSC CGL Previous Papers",
      "pdfUrl":
          "https://www.careerpower.in/blog/wp-content/uploads/2023/04/04124006/ssc-cgl-01-dec-2022-shift-1-question-paper.pdf",
    },
    {
      "title": "SSC CGL Previous Papers",
      "pdfUrl":
          "https://www.adda247.com/jobs/wp-content/uploads/2021/05/11093233/9_march_shift_1.pdf",
    },
    {
      "title": "SSC CGL Previous Papers",
      "pdfUrl":
          "https://www.careerpower.in/2022/ssc-cgl-tier-1-13-august-2021-shift-1.pdf",
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
        backgroundColor: Colors.purpleAccent,
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

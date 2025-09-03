import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class General extends StatelessWidget {
  const General({super.key});

  @override
  Widget build(BuildContext context) {
    // Topic list with optional PDF URL
    List<Map<String, dynamic>> topics = [
      {
        'title': 'Indian History',
        'pdfurl':
            'https://www.toppersnotes.com/wp-content/uploads/2020/12/SSC-CGL-eng-latest-GA-Samples.pdf?srsltid=AfmBOoopqgo5RIMbxzY4-TAm-H1M9GUnZWOz6Vxd_pSc5PihsUvQE0qr',
      },
      {
        'title': 'Biology',
        'pdfurl':
            'https://www.toppersnotes.com/wp-content/uploads/2020/12/SSC-CGL-eng-latest-Science-Samples.pdf?srsltid=AfmBOoo1bjzPO9q4QVRAAANfY-8IwbNPaUIe4z-OxYw3hjXvTQ2R7UoR',
      },
      {
        'title': 'Chemistry',
        'pdfurl':
            'https://www.toppersnotes.com/wp-content/uploads/2020/12/SSC-CGL-eng-latest-Science-Samples.pdf?srsltid=AfmBOooSo2-Ibk3eAI-s5EpNqNxXth235euPfkoVtqWz4-ku3cswiReH',
      },
      {
        'title': 'Physics',
        'pdfurl':
            'https://www.toppersnotes.com/wp-content/uploads/2020/12/SSC-CGL-eng-latest-Science-Samples.pdf?srsltid=AfmBOooSo2-Ibk3eAI-s5EpNqNxXth235euPfkoVtqWz4-ku3cswiReH',
      },
      {
        'title': 'Geography',
        'pdfurl':
            'https://www.toppersnotes.com/wp-content/uploads/2020/12/SSC-CGL-eng-latest-GA-Samples.pdf?srsltid=AfmBOoopqgo5RIMbxzY4-TAm-H1M9GUnZWOz6Vxd_pSc5PihsUvQE0qr',
      },
      {
        'title': 'Polity',
        'pdfurl':
            'https://www.toppersnotes.com/wp-content/uploads/2020/12/SSC-CGL-eng-latest-GA-Samples.pdf?srsltid=AfmBOoopqgo5RIMbxzY4-TAm-H1M9GUnZWOz6Vxd_pSc5PihsUvQE0qr',
      },
      {
        'title': 'Economy',
        'pdfurl':
            'https://www.toppersnotes.com/wp-content/uploads/2020/12/SSC-CGL-eng-latest-GA-Samples.pdf?srsltid=AfmBOoopqgo5RIMbxzY4-TAm-H1M9GUnZWOz6Vxd_pSc5PihsUvQE0qr',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("General Awareness"),
        centerTitle: true,
        backgroundColor: Colors.yellowAccent,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Header
          Row(
            children: [
              Image.asset('assets/images/gaimage.jpg', height: 60, width: 60),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'General Awareness for SSC CGL',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Topics List
          //no.of arugments to generate
          ...List.generate(topics.length, (index) {
            final topic = topics[index];
            return Card(
              elevation: 1,
              margin: const EdgeInsets.symmetric(vertical: 6),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                leading: Text(
                  (index + 1).toString().padLeft(2, '0') + '.',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
                title: GestureDetector(
                  onTap: () async {
                    if (topic['pdfurl'] != null) {
                      final Uri url = Uri.parse(topic['pdfurl']);
                      if (await canLaunchUrl(url)) {
                        await launchUrl(
                          url,
                          mode: LaunchMode.externalApplication,
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Could not open PDF')),
                        );
                      }
                    }
                  },
                  child: Text(
                    topic['title'],
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color:
                          topic['pdfurl'] != null ? Colors.blue : Colors.black,
                      decoration:
                          topic['pdfurl'] != null
                              ? TextDecoration.underline
                              : null,
                    ),
                  ),
                ),
                trailing:
                    topic['pdfurl'] != null
                        ? const Icon(Icons.picture_as_pdf, color: Colors.red)
                        : const Icon(Icons.arrow_forward_ios, size: 16),
              ),
            );
          }),
        ],
      ),
    );
  }
}

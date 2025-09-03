import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Aptitude extends StatelessWidget {
  const Aptitude({super.key});

  // Sample data with links
  final List<Map<String, dynamic>> topics = const [
    {
      'title': 'Number System',
      'videoUrl':
          'https://www.youtube.com/watch?v=qwHJtfEUCgE&list=PLOoogDtEDyvvLxig0poIGPWnGF74R4uxq',
    },
    {
      'title': 'Simplification & Approximation',
      'videoUrl':
          'https://www.youtube.com/watch?v=8TB83YtGIOw&list=PLOoogDtEDyvv3LqdasAriQdLCKNmrOMH4',
    },
    {
      'title': 'Compound Interest',
      'videoUrl':
          'https://www.youtube.com/watch?v=t8D38-cdlRA&list=PLOoogDtEDyvudcQ9ODIyJUTEc2xjWupvi',
    },
    {
      'title': 'simple Interest',
      'videoUrl':
          'https://www.youtube.com/watch?v=B7VqoXjoHPk&list=PLaApQwNmfXegqJPmXgKy-JcV3BomRom5_',
    },
    {
      'title': 'Time and Work',
      'videoUrl':
          'https://www.youtube.com/watch?v=RhCwy2j2pHY&list=PLOoogDtEDyvtbV-jgkZ0-i-PS2oUmSHk4',
    },
    {
      'title': 'Geometry',
      'videoUrl': 'https://www.youtube.com/watch?v=AmkHrF63tWg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quantitative Aptitude"),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: topics.length,
        itemBuilder: (context, index) {
          final topic = topics[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 2,
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Row(
                    children: [
                      Text(
                        '${(index + 1).toString().padLeft(2, '0')}.',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          topic['title'],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  // Action icons row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _iconButton(
                        icon: Icons.play_circle_fill,
                        label: 'Video',
                        url: topic['videoUrl'],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _iconButton({
    required IconData icon,
    required String label,
    required String url,
  }) {
    return InkWell(
      onTap: () async {
        final uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri, mode: LaunchMode.externalApplication);
        } else {
          throw 'Could not launch $url';
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 28, color: Colors.indigo),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}

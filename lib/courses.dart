import 'package:flutter/material.dart';
import 'package:project_1/aptitude.dart';
import 'package:project_1/arithmetics.dart';
import 'package:project_1/english.dart';
import 'package:project_1/general.dart';
import 'package:project_1/intelligance.dart';
import 'package:project_1/mocktest.dart';
import 'package:project_1/previous.dart';
import 'package:url_launcher/url_launcher.dart';

class Courses extends StatelessWidget {
  const Courses({super.key});

  Widget _buildCourseTile(
    BuildContext context,
    String title,
    String assetPath,
    Widget destinationPage,
  ) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Image.asset(
          assetPath,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => destinationPage),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SSC CGL Courses'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildCourseTile(
              context,
              'General Awareness',
              'assets/images/gaimage.jpg',
              const General(),
            ),
            _buildCourseTile(
              context,
              'Quantitative Aptitude',
              'assets/images/qaimage.png',
              const Aptitude(),
            ),
            _buildCourseTile(
              context,
              'Arithmetics',
              'assets/images/arithmeticimage.webp',
              const Arithmetics(),
            ),
            _buildCourseTile(
              context,
              'English Language & Comprehension',
              'assets/images/elcimage.png',
              const English(),
            ),
            _buildCourseTile(
              context,
              'General Intelligance & Reasoning for SSC CGL',
              'assets/images/girimage.jpg',
              const Intelligance(),
            ),
            _buildCourseTile(
              context,
              'Previous Year Papers',
              'assets/images/pypaperimage.png',
              const Previous(),
            ),
            _buildCourseTile(
              context,
              'Mock Tests',
              'assets/images/mtimage.jpg',
              const MockTest(),
            ),
          ],
        ),
      ),
    );
  }
}

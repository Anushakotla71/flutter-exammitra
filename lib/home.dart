import 'package:flutter/material.dart';
import 'package:project_1/Testseries.dart';
import 'package:project_1/aptitude.dart';
import 'package:project_1/arithmetics.dart';
import 'package:project_1/courses.dart';
import 'package:project_1/dailyquiz.dart';
import 'package:project_1/english.dart';
import 'package:project_1/general.dart';
import 'package:project_1/paper.dart';
import 'package:project_1/previous.dart';
import 'package:project_1/profilescreen.dart';
import 'package:project_1/progress.dart';
import 'package:project_1/store.dart';
import 'package:project_1/mocktest.dart';
import 'package:project_1/syllabus.dart';

// Separate HomePageContent to avoid recursive call
class HomePageContent extends StatelessWidget {
  const HomePageContent({super.key});

  Widget _courseTile(
    BuildContext context,
    String title,
    String assetPath,
    Widget page, //parameters
  ) {
    return Card(
      child: ListTile(
        leading: Image.asset(
          assetPath,
          width: 40,
          height: 40,
          fit: BoxFit.cover,
        ),
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          'My Courses',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Row(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const Courses()),
                );
              },
              child: const Text('Courses'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const Syllabus()),
                );
              },
              child: const Text('Syllabus'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const Progress()),
                );
              },
              child: const Text('Progress'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const Previous()),
                );
              },
              child: const Text('Previous Year'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const MockTest()),
                );
              },
              child: const Text('Mock Tests'),
            ),
          ],
        ),
        const SizedBox(height: 20),
        _courseTile(
          context,
          'General Awareness for SSC CGL',
          'assets/images/gaimage.jpg',
          const General(),
        ),
        _courseTile(
          context,
          'Quantitative Aptitude for SSC CGL',
          'assets/images/qaimage.png',
          const Aptitude(),
        ),
        _courseTile(
          context,
          'English Language & Comprehension for SSC CGL',
          'assets/images/elcimage.png',
          const English(),
        ),
        _courseTile(
          context,
          'Arithmetics',
          'assets/images/arithmeticimage.webp',
          const Arithmetics(),
        ),
        _courseTile(
          context,
          'SSC CGL previous year papers',
          'assets/images/pypaperimage.png',
          const Paper(),
        ),
        _courseTile(
          context,
          'SSC CGL Mock Test Series',
          'assets/images/mtimage.jpg',
          const Testseries(),
        ),
        _courseTile(
          context,
          'Daily Quiz',
          'assets/images/quiz.webp',
          const Dailyquiz(),
        ),
      ],
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    HomePageContent(),
    store(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    if (index == 3) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Logout'),
            content: const Text('Are you sure you want to logout?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close dialog
                },
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close dialog
                  Navigator.pop(context); // Actually logout (pop Home)
                },
                child: const Text('Logout'),
              ),
            ],
          );
        },
      );
      return; // Prevent updating _selectedIndex to 3
    }
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Image.asset('assets/images/SSCCGL.webp', height: 40),
            ),
            const SizedBox(width: 8),
            const Text('SSC CGL'),
          ],
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Store',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.logout), label: 'logout'),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:project_1/payment.dart';

// ignore: camel_case_types
class store extends StatefulWidget {
  const store({super.key});

  @override
  State<store> createState() => _storeState();
}

class _storeState extends State<store> {
  final List<Map<String, String>> packages = const [
    {
      'title': 'RRB NTPC / ASM / CA / TA Package',
      'image': 'assets/images/rrb.png',
      'price': '1500',
    },
    {
      'title': 'Bank Exams Package',
      'image': 'assets/images/bank.png',
      'price': '2000',
    },
    {
      'title': 'UPSC Package',
      'image': 'assets/images/upsc.jpg',
      'price': '25000',
    },
    {
      'title': 'SSC MTS / SSC GD Package',
      'image': 'assets/images/SSCCGL.webp',
      'price': '25000',
    },
    {
      'title': 'SSC CHSL Package',
      'image': 'assets/images/SSCCGL.webp',
      'price': '2000',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Students can also Purchased'),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        itemCount: packages.length,
        itemBuilder: (context, index) {
          final package = packages[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Image.asset(package['image']!, width: 50, height: 50),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      package['title']!,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(width: 6),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (_) => PaymentScreen(
                                amount:
                                    package['price']!, // Pass the price to PaymentScreen
                              ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo[900],
                    ),
                    child: Text(
                      'Buy Now ₹${package['price']}', // Display price on button
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

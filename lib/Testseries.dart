import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(debugShowCheckedModeBanner: false, home: Testseries()),
  );
}

class Testseries extends StatefulWidget {
  const Testseries({super.key});

  @override
  State<Testseries> createState() => _TestseriesState();
}

class _TestseriesState extends State<Testseries> {
  final List<Map<String, dynamic>> questions = [
    {
      "question": "1. Who was the first President of India?",
      "options": [
        "Dr. Rajendra Prasad",
        "Jawaharlal Nehru",
        "APJ Abdul Kalam",
        "B. R. Ambedkar",
      ],
      "answer": "Dr. Rajendra Prasad",
    },
    {
      "question": "2. Which is the longest river in India?",
      "options": ["Ganga", "Yamuna", "Godavari", "Brahmaputra"],
      "answer": "Ganga",
    },
    {
      "question": "3. Who wrote the National Anthem of India?",
      "options": [
        "Rabindranath Tagore",
        "Bankim Chandra Chattopadhyay",
        "Subhash Chandra Bose",
        "Sarojini Naidu",
      ],
      "answer": "Rabindranath Tagore",
    },
    {
      "question": "4. In which year did India gain independence?",
      "options": ["1945", "1946", "1947", "1950"],
      "answer": "1947",
    },
    {
      "question": "5. Which planet is known as the Red Planet?",
      "options": ["Earth", "Venus", "Jupiter", "Mars"],
      "answer": "Mars",
    },
    {
      "question": "6. What is the capital of Australia?",
      "options": ["Sydney", "Melbourne", "Canberra", "Perth"],
      "answer": "Canberra",
    },
    {
      "question": "7. Who is known as the Iron Man of India?",
      "options": [
        "Lal Bahadur Shastri",
        "Sardar Vallabhbhai Patel",
        "Subhash Chandra Bose",
        "Bhagat Singh",
      ],
      "answer": "Sardar Vallabhbhai Patel",
    },
    {
      "question": "8. Which is the smallest state in India by area?",
      "options": ["Goa", "Sikkim", "Tripura", "Manipur"],
      "answer": "Goa",
    },
    {
      "question": "9. The Constitution of India was adopted in which year?",
      "options": ["1947", "1948", "1949", "1950"],
      "answer": "1949",
    },
    {
      "question": "10. Who is the current President of India (as of 2024)?",
      "options": [
        "Ram Nath Kovind",
        "Pranab Mukherjee",
        "Droupadi Murmu",
        "Narendra Modi",
      ],
      "answer": "Droupadi Murmu",
    },
  ];

  Map<int, String> selectedAnswers = {};

  int calculateScore() {
    int score = 0;
    for (int i = 0; i < questions.length; i++) {
      if (selectedAnswers[i] == questions[i]['answer']) {
        score++;
      }
    }
    return score;
  }

  void finishTest(BuildContext context) {
    int score = calculateScore();
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: const Text('Test Completed'),
            content: Text('Your score is $score out of ${questions.length}'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Close dialog
                  Navigator.pop(context); // Back to previous/home
                },
                child: const Text('OK'),
              ),
            ],
          ),
    );
  }

  Color? getOptionColor(int index, String option) {
    final selected = selectedAnswers[index];
    final correct = questions[index]['answer'];
    if (selected == null) return null;
    if (option == selected) {
      return option == correct ? Colors.green[200] : Colors.red[200];
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mock Test"),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: questions.length,
              itemBuilder: (context, index) {
                final question = questions[index];
                final selected = selectedAnswers[index];

                return Card(
                  elevation: 3,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          question['question'],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 10),
                        ...List<Widget>.from(
                          (question['options'] as List<String>).map((option) {
                            final color = getOptionColor(index, option);
                            final disabled = selected != null;

                            return Container(
                              margin: const EdgeInsets.symmetric(vertical: 4),
                              decoration: BoxDecoration(
                                color: color,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.grey.shade300),
                              ),
                              child: RadioListTile<String>(
                                value: option,
                                groupValue: selectedAnswers[index],
                                title: Text(option),
                                onChanged:
                                    disabled
                                        ? null
                                        : (value) {
                                          setState(() {
                                            selectedAnswers[index] = value!;
                                          });
                                        },
                                activeColor: Colors.teal,
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () => finishTest(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
            ),
            child: const Text(
              'Finish Test',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

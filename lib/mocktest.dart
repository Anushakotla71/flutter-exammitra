import 'package:flutter/material.dart';

class MockTest extends StatefulWidget {
  const MockTest({super.key});

  @override
  State<MockTest> createState() => _MockTestState();
}

class _MockTestState extends State<MockTest> {
  final List<Map<String, dynamic>> questions = [
    {
      "type": "Aptitude",
      "question": "1. What is the square root of 144?",
      "options": ["10", "11", "12", "13"],
      "answer": "12",
    },
    {
      "type": "Aptitude",
      "question":
          "2. A train running at 60 km/h crosses a pole in 30 seconds. What is its length?",
      "options": ["400 m", "500 m", "600 m", "300 m"],
      "answer": "500 m",
    },
    {
      "type": "Aptitude",
      "question":
          "3. If the cost price is ₹150 and profit is 20%, what is the selling price?",
      "options": ["₹160", "₹170", "₹180", "₹190"],
      "answer": "₹180",
    },
    {
      "type": "Aptitude",
      "question": "4. What is the value of (2 + 3 × 4)?",
      "options": ["14", "20", "18", "12"],
      "answer": "14",
    },
    {
      "type": "Aptitude",
      "question":
          "5. A man can complete a work in 15 days, how much work will he do in 5 days?",
      "options": ["1/2", "1/3", "1/4", "1/5"],
      "answer": "1/3",
    },
    {
      "type": "Reasoning",
      "question": "6. If CAT = 3120, then DOG = ?",
      "options": ["4715", "5147", "7415", "1547"],
      "answer": "4715",
    },
    {
      "type": "Reasoning",
      "question": "7. Find the odd one out: Apple, Banana, Mango, Carrot",
      "options": ["Apple", "Banana", "Mango", "Carrot"],
      "answer": "Carrot",
    },
    {
      "type": "Reasoning",
      "question": "8. Complete the series: 2, 4, 8, 16, __?",
      "options": ["18", "24", "32", "30"],
      "answer": "32",
    },
    {
      "type": "Reasoning",
      "question": "9. TRUE or FALSE: All squares are rectangles.",
      "options": ["TRUE", "FALSE"],
      "answer": "TRUE",
    },
    {
      "type": "Reasoning",
      "question":
          "10. If 1st Jan 2021 was a Friday, what day was 1st Jan 2022?",
      "options": ["Friday", "Saturday", "Sunday", "Monday"],
      "answer": "Saturday",
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
                  Navigator.pop(context); // Go back to home
                },
                child: const Text('OK'),
              ),
            ],
          ),
    );
  }

  Color? getOptionColor(int index, String option) {
    final correctAnswer = questions[index]['answer'];
    final selectedAnswer = selectedAnswers[index];

    if (selectedAnswer == null) return null;

    if (option == selectedAnswer) {
      return option == correctAnswer ? Colors.green[200] : Colors.red[200];
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mock Test"),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: questions.length,
              itemBuilder: (context, index) {
                final question = questions[index];
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
                          "${question['type']} Question",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple,
                          ),
                        ),
                        const SizedBox(height: 8),
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
                            final isSelected = selectedAnswers.containsKey(
                              index,
                            );
                            final bgColor = getOptionColor(index, option);

                            return Container(
                              margin: const EdgeInsets.symmetric(vertical: 4),
                              decoration: BoxDecoration(
                                color: bgColor,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.grey.shade300),
                              ),
                              child: RadioListTile<String>(
                                value: option,
                                groupValue: selectedAnswers[index],
                                title: Text(option),
                                onChanged:
                                    isSelected
                                        ? null
                                        : (value) {
                                          setState(() {
                                            selectedAnswers[index] = value!;
                                          });
                                        },
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
              backgroundColor: Colors.indigo,
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

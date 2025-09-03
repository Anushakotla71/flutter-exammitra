import 'package:flutter/material.dart';

class Dailyquiz extends StatefulWidget {
  const Dailyquiz({super.key});

  @override
  State<Dailyquiz> createState() => _DailyquizState();
}

class _DailyquizState extends State<Dailyquiz> {
  int currentQuestionIndex = 0;
  int score = 0;
  bool answered = false;
  int? selectedOptionIndex;

  final List<Map<String, dynamic>> questions = [
    {
      'question': 'Which is the largest continent?',
      'options': ['Africa', 'Asia', 'Europe', 'Australia'],
      'answerIndex': 1,
    },
    {
      'question': 'Who wrote the National Anthem of India?',
      'options': [
        'Bankim Chandra',
        'Sarojini Naidu',
        'Rabindranath Tagore',
        'Subhash Chandra Bose',
      ],
      'answerIndex': 2,
    },
    {
      'question': 'Which planet is known as the Red Planet?',
      'options': ['Earth', 'Venus', 'Mars', 'Jupiter'],
      'answerIndex': 2,
    },
    {
      'question': 'In which year was the Indian Constitution adopted?',
      'options': ['1947', '1949', '1950', '1952'],
      'answerIndex': 1,
    },
    {
      'question': 'What is the capital of Assam?',
      'options': ['Dispur', 'Guwahati', 'Shillong', 'Agartala'],
      'answerIndex': 0,
    },
    {
      'question': 'Who discovered the sea route to India?',
      'options': ['Columbus', 'Vasco da Gama', 'Magellan', 'Marco Polo'],
      'answerIndex': 1,
    },
    {
      'question': 'Which gas is most abundant in the atmosphere?',
      'options': ['Oxygen', 'Nitrogen', 'Carbon Dioxide', 'Hydrogen'],
      'answerIndex': 1,
    },
    {
      'question': 'Which Mughal emperor built the Red Fort?',
      'options': ['Akbar', 'Babur', 'Shah Jahan', 'Aurangzeb'],
      'answerIndex': 2,
    },
    {
      'question': 'What is the full form of GDP?',
      'options': [
        'Gross Domestic Product',
        'General Department Policy',
        'Gross Development Project',
        'Government Domestic Planning',
      ],
      'answerIndex': 0,
    },
    {
      'question': 'Where is the headquarters of the UN?',
      'options': ['Geneva', 'Paris', 'New York', 'London'],
      'answerIndex': 2,
    },
  ];

  void checkAnswer(int selectedIndex) {
    if (!answered) {
      setState(() {
        selectedOptionIndex = selectedIndex;
        answered = true;
        if (selectedIndex == questions[currentQuestionIndex]['answerIndex']) {
          score++;
        }
      });
    }
  }

  void nextQuestion() {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        answered = false;
        selectedOptionIndex = null;
      });
    } else {
      showDialog(
        context: context,
        builder:
            (_) => AlertDialog(
              title: const Text("Quiz Completed!"),
              content: Text("You scored $score out of ${questions.length}."),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close dialog
                    Navigator.of(context).pop(); // Go to home page
                  },
                  child: const Text("OK"),
                ),
              ],
            ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final current = questions[currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily Quiz'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Q${currentQuestionIndex + 1}: ${current['question']}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // ✅ Radio buttons
            ...List.generate(current['options'].length, (index) {
              final option = current['options'][index];
              final isCorrect = index == current['answerIndex'];
              final isSelected = index == selectedOptionIndex;

              Color tileColor = Colors.white;
              if (answered) {
                if (isCorrect) {
                  tileColor = Colors.green.shade100;
                } else if (isSelected) {
                  tileColor = Colors.red.shade100;
                }
              }

              return Card(
                color: tileColor,
                child: RadioListTile<int>(
                  value: index,
                  groupValue: selectedOptionIndex,
                  onChanged: (value) {
                    if (!answered) {
                      checkAnswer(value!);
                    }
                  },
                  title: Text(option),
                  activeColor: Colors.indigo,
                ),
              );
            }),

            const SizedBox(height: 20),

            // ✅ Blue Button with white text
            Center(
              child: ElevatedButton(
                onPressed: answered ? nextQuestion : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  foregroundColor: Colors.white, // Ensures white text
                  textStyle: const TextStyle(fontSize: 16),
                ),
                child: Text(
                  currentQuestionIndex == questions.length - 1
                      ? 'Finish'
                      : 'Next',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class Progress extends StatelessWidget {
  const Progress({super.key});

  // Sample test data (could come from backend or local DB)
  final List<TestResult> testScores = const [
    TestResult("Aptitude", 7),
    TestResult("Reasoning", 9),
    TestResult("English", 8),
    TestResult("GA", 6),
    TestResult("Mock 1", 10),
  ];

  final List<TopicPerformance> topicDistribution = const [
    TopicPerformance("Correct", 32, Colors.green),
    TopicPerformance("Incorrect", 8, Colors.red),
    TopicPerformance("Skipped", 5, Colors.orange),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Progress Tracker & Analytics"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        elevation: 4, // Add shadow for better AppBar appearance
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 20,
        ), // Adjusted padding
        child: ListView(
          children: [
            // Test Scores Section
            const Text(
              "Test Scores",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16), // Space between title and chart
            Container(
              height: 300, // Increased height for better visibility
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 8,
                    spreadRadius: 2,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: 12, // Set max Y-axis to give headroom for scores
                  barGroups:
                      testScores.asMap().entries.map((entry) {
                        return BarChartGroupData(
                          x: entry.key,
                          barRods: [
                            BarChartRodData(
                              toY: entry.value.score.toDouble(),
                              color: Colors.blueAccent,
                              width: 16, // Reduced width for better spacing
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(4),
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                  titlesData: FlTitlesData(
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40, // Increased space for labels
                        getTitlesWidget: (value, meta) {
                          if (value.toInt() < testScores.length) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Text(
                                testScores[value.toInt()].testName,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black87,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            );
                          }
                          return const Text('');
                        },
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40,
                        getTitlesWidget: (value, meta) {
                          return Text(
                            value.toInt().toString(),
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.black87,
                            ),
                          );
                        },
                      ),
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  gridData: FlGridData(
                    show: true,
                    drawHorizontalLine: true,
                    horizontalInterval: 2,
                    getDrawingHorizontalLine: (value) {
                      return FlLine(
                        color: Colors.grey.withOpacity(0.2),
                        strokeWidth: 1,
                      );
                    },
                  ),
                  barTouchData: BarTouchData(
                    enabled: true,
                    touchTooltipData: BarTouchTooltipData(
                      // backgroundColor: Colors.deepPurple.withOpacity(0.8),
                      getTooltipItem: (group, groupIndex, rod, rodIndex) {
                        return BarTooltipItem(
                          '${testScores[groupIndex].testName}\n${rod.toY.toInt()}',
                          const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40), // Increased spacing between charts
            // Topic-wise Performance Section
            const Text(
              "Topic-wise Performance",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              height: 300, // Increased height for better visibility
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 8,
                    spreadRadius: 2,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: PieChart(
                PieChartData(
                  sections:
                      topicDistribution.asMap().entries.map((entry) {
                        return PieChartSectionData(
                          value: entry.value.value.toDouble(),
                          color: entry.value.color,
                          title: '${entry.value.label}\n${entry.value.value}',
                          radius: 80, // Increased radius for larger sections
                          titleStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          titlePositionPercentageOffset:
                              0.6, // Move labels outward
                        );
                      }).toList(),
                  sectionsSpace: 4, // Increased space between sections
                  centerSpaceRadius: 50, // Slightly larger center space
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TestResult {
  final String testName;
  final int score;
  const TestResult(this.testName, this.score);
}

class TopicPerformance {
  final String label;
  final int value;
  final Color color;
  const TopicPerformance(this.label, this.value, this.color);
}

import 'package:flutter/material.dart';
import 'package:quiz/data/questions.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.chosenAnswers});

  final List<String> chosenAnswers;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData
        .where((data) => data['user_answer'] == data['correct_answer'])
        .length;

    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            Color.fromARGB(255, 76, 187, 172), // Make AppBar transparent
        elevation: 0, // Remove shadow
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 76, 187, 172),
              Color.fromARGB(255, 221, 224, 227),
              Color.fromARGB(255, 76, 187, 172),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                const SizedBox(height: 30),
                ListView.builder(
                  shrinkWrap: true, // Important to avoid unbounded height error
                  physics:
                      NeverScrollableScrollPhysics(), // Disable ListView's own scrolling
                  itemCount: summaryData.length,
                  itemBuilder: (ctx, index) {
                    final data = summaryData[index];
                    final questionIndex = data['question_index'] as int;
                    final questionText = data['question'] as String;
                    final correctAnswer = data['correct_answer'] as String;
                    final userAnswer = data['user_answer'] as String;

                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Text('${questionIndex + 1}'),
                        ),
                        title: Text(questionText),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 5),
                            Text(
                              'Your Answer: $userAnswer',
                              style: TextStyle(
                                color: userAnswer == correctAnswer
                                    ? Color.fromARGB(255, 240, 104, 233)
                                    : Colors.red,
                              ),
                            ),
                            Text(
                              'Correct Answer: $correctAnswer',
                              style: const TextStyle(color: Colors.blue),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                // Uncomment the following lines to add a restart button
                // const SizedBox(height: 30),
                // ElevatedButton(
                //   onPressed: () {
                //     // Restart the quiz logic here
                //   },
                //   child: const Text('Restart Quiz!'),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

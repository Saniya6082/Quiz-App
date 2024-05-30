import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});
  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 76, 187, 172),
              Color.fromARGB(255, 221, 224, 227),
              Color.fromARGB(255, 76, 187, 172)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Opacity(
                opacity: 0.9, // Adjust opacity as needed
                child: Image.asset(
                  'assets/image/logo.png',
                  width: 300,
                  height: 300,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Learn Languages In a Fun Way',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              OutlinedButton.icon(
                onPressed: startQuiz,
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color.fromARGB(255, 13, 13, 13),
                  side: BorderSide(
                      color: const Color.fromARGB(
                          255, 10, 10, 10)), // Border color
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                icon: const Icon(Icons.arrow_right_alt),
                label: const Text('Start Quiz'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

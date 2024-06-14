import 'package:flutter/material.dart';

void main() {
  runApp(QuizApp());
}

class Question {
  final String questionText;
  final bool answer;
  final String explanation;

  Question({required this.questionText, required this.answer, required this.explanation});
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Question> questions = [
    Question(
      questionText: 'Is water recycling possible?',
      answer: true,
      explanation:
      '1: Water recycling is possible. It refers to treating and cleaning used or polluted water to make it reusable in treatment plants or advanced treatment technologies.',
    ),
    Question(
      questionText: 'Do sustainable farming methods improve soil fertility?',
      answer: true,
      explanation: '2: Sustainable farming methods can improve soil fertility.',
    ),
    Question(
      questionText: 'Can we choose transportation methods to reduce our ecological footprint?',
      answer: false,
      explanation: '3: We can reduce our ecological footprint by choosing transportation methods.',
    ),
    Question(
      questionText: 'Do plastic bottles completely melt during the recycling process?',
      answer: true,
      explanation:
      '4: Plastic bottles do not completely melt during the recycling process. They are often melted but not fully dissolved.',
    ),
    Question(
      questionText: 'Is biodiversity loss a significant issue for environmental sustainability?',
      answer: true,
      explanation: '5: Biodiversity loss is a significant issue for environmental sustainability.',
    ),
    Question(
      questionText: 'Does paper recycling help reduce deforestation?',
      answer: true,
      explanation:
      '6: Paper recycling is an effective method to reduce deforestation. It involves collecting, reclaiming, and using waste paper to produce new paper.',
    ),
    Question(
      questionText: 'Does climate change increase the frequency and severity of natural disasters?',
      answer: true,
      explanation: '7: Climate change increases the frequency and severity of natural disasters.',
    ),
    Question(
      questionText: 'Are eco-friendly products generally more expensive?',
      answer: false,
      explanation:
      '8: The prices of eco-friendly products are generally higher compared to standard products, but this is not always the case.',
    ),
    Question(
      questionText: 'Is using water efficiently only effective for individuals? ',
      answer: false,
      explanation:
      '9: Using water efficiently is not only effective individually but also creates a social impact.',
    ),
    Question(
      questionText: 'Does sustainability aim to prevent the depletion of natural resources?',
      answer: true,
      explanation: '10: Sustainability aims to prevent the depletion of natural resources.',
    ),
  ];

  int currentQuestionIndex = 0;
  int score = 0;

  void checkAnswer(bool userAnswer) {
    if (userAnswer == questions[currentQuestionIndex].answer) {
      score++;
    }

    setState(() {
      currentQuestionIndex++;
    });

    if (currentQuestionIndex >= questions.length) {
      _showScoreDialog();
    }
  }

  void _showScoreDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Quiz Finished"),
        content: Text("Your score is $score/${questions.length}"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              setState(() {
                currentQuestionIndex = 0;
                score = 0;
              });
            },
            child: Text("Restart"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz App"),
        backgroundColor: Colors.green,
      ),
      body: currentQuestionIndex < questions.length
          ? Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              questions[currentQuestionIndex].questionText,
              style: TextStyle(fontSize: 24.0),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () => checkAnswer(true),
              style: ElevatedButton.styleFrom(
                // primary: Colors.green,
              ),
              child: Text("Yes"),
            ),
            ElevatedButton(
              onPressed: () => checkAnswer(false),
              style: ElevatedButton.styleFrom(
                // primary: Colors.green,
              ),
              child: Text("No"),
            ),
          ],
        ),
      )
          : Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Quiz Finished! Your score is $score/${questions.length}",
              style: TextStyle(fontSize: 24.0),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  currentQuestionIndex = 0;
                  score = 0;
                });
              },
              style: ElevatedButton.styleFrom(
                // primary: Colors.green,
              ),
              child: Text("Restart Quiz"),
            ),
          ],
        ),
      ),
    );
  }
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuizPage(),
    );
  }
}

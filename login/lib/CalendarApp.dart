import 'package:flutter/material.dart';

void main() {
  runApp(CalendarApp());
}

class CalendarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sustainable Living Progress Calendar',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: CalendarScreen(),
    );
  }
}

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  int _currentMonthIndex = 0;
  List<String> _months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  List<int> _daysInMonth = [
    31, // January
    31, // February
    31, // March
    30, // April
    31, // May
    30, // June
    31, // July
    31, // August
    30, // September
    31, // October
    30, // November
    31, // December
  ];

  List<List<String>> _notes = List<List<String>>.generate(
    12,
        (index) => List<String>.generate(31, (index) => ''),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sustainable Living Progress Calendar',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _months[_currentMonthIndex],
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7,
                ),
                itemBuilder: (context, index) {
                  final day = index + 1;
                  final note = _notes[_currentMonthIndex][day - 1];
                  return GestureDetector(
                    onTap: () {
                      _showNoteDialog(context, day, note);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.green),
                      ),
                      child: Center(
                        child: Text(
                          day.toString(),
                          style: TextStyle(
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: _daysInMonth[_currentMonthIndex],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    color: Colors.green,
                    onPressed: () {
                      setState(() {
                        if (_currentMonthIndex > 0) {
                          _currentMonthIndex--;
                        }
                      });
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.arrow_forward),
                    color: Colors.green,
                    onPressed: () {
                      setState(() {
                        if (_currentMonthIndex < 11) {
                          _currentMonthIndex++;
                        }
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showNoteDialog(BuildContext context, int day, String note) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Take note',
          style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: TextFormField(
          initialValue: note,
          onChanged: (value) {
            setState(() {
              _notes[_currentMonthIndex][day - 1] = value;
            });
          },
          decoration: InputDecoration(
            labelText: 'Note',
          ),
        ),
        actions: [
          TextButton(
            child: Text(
              'Close',
              style: TextStyle(
                color: Colors.green,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}

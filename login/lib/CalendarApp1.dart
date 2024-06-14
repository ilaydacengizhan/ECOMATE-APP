import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(CalendarApp1());
}

class CalendarApp1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Event Calendar',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Event Calendar',
            textAlign: TextAlign.center,
          ),
          centerTitle: true,
          backgroundColor: Colors.green, // Added green color
        ),
        body: CalendarScreen(),
      ),
    );
  }
}

class CalendarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 12,
      itemBuilder: (context, index) {
        return MonthCalendar(month: index);
      },
    );
  }
}

class MonthCalendar extends StatelessWidget {
  final int month;

  MonthCalendar({required this.month});

  Object? get day => null;

  String _getMonthName() {
    final List<String> monthNames = [
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
    return monthNames[month];
  }
  String _getRandomConferenceTopic() {
    final List<String> conferenceTopics = [
      'Food Sustainability',
      'Worker Rights Sustainability',
      'Sustainability in Tourism',
      'Water Resources Sustainability',
      'Energy Sustainability',
      // Add more conference topics as desired
    ];
    final random = Random();
    return conferenceTopics[random.nextInt(conferenceTopics.length)];
  }
  @override
  Widget build(BuildContext context) {
    final random = Random();
    final daysInMonth = month == 2 ? 31 : DateTime(DateTime.now().year, month + 1, 0).day;
    final List<int> eventDays = [];

    while (eventDays.length < 5) {
      final randomDay = random.nextInt(daysInMonth) + 1;
      if (!eventDays.contains(randomDay)) {
        eventDays.add(randomDay);
      }
    }

    final int treePlantingDay = random.nextInt(daysInMonth) + 1;
    final List<int> conferenceDays = [];
    while (conferenceDays.length < 2) {
      final randomDay = random.nextInt(daysInMonth) + 1;
      if (!eventDays.contains(randomDay) && randomDay != treePlantingDay) {
        conferenceDays.add(randomDay);
      }
    }
    final conferenceTopic = _getRandomConferenceTopic();
    final hasConference = conferenceDays.contains(day);
    final conferenceDescription = hasConference
        ? 'Conference event\nDate: $day ${_getMonthName()}\nHour: ${random.nextInt(24)}:00\nLocation: ${_getRandomStreetName()}, Turkey\nSpeaker: ${_getRandomSpeaker()}\nSubject: ${_getRandomConferenceTopic()}'
        : '';



    final List<int> bikeTourDays = []; // New variable
    while (bikeTourDays.length < 4) {
      final randomDay = random.nextInt(daysInMonth) + 1;
      if (!eventDays.contains(randomDay) && !conferenceDays.contains(randomDay) && randomDay != treePlantingDay) {
        bikeTourDays.add(randomDay);
      }
    }

    return Column(
      children: [
        SizedBox(height: 20),
        Text(
          _getMonthName(),
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        GridView.builder(
          shrinkWrap: true,
          itemCount: daysInMonth,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
          ),
          itemBuilder: (context, index) {
            final day = index + 1;
            final hasEvent = eventDays.contains(day);
            final hasConference = conferenceDays.contains(day);
            final isTreePlantingDay = day == treePlantingDay;
            final isBikeTourDay = bikeTourDays.contains(day);

            final eventDescription = hasEvent
                ? 'Garbage collection event\nDate: $day ${_getMonthName()}\nHour: ${random.nextInt(24)}:00\nLocation: ${_getRandomStreetName()}, Istanbul\nMaterials: Gloves, mask'
                : '';
            final conferenceDescription = hasConference
                ? 'Conference event\nDate: $day ${_getMonthName()}\nHour: ${random.nextInt(24)}:00\nLocation: ${_getRandomStreetName()}, Turkey\nSpeaker: ${_getRandomSpeaker()}\nSubject: ${_getRandomConferenceTopic()}'
                : '';
            final treePlantingDescription = isTreePlantingDay
                ? 'Tree planting event\nDate: $day ${_getMonthName()}\nHour: ${random.nextInt(24)}:00\nLocation: ${_getRandomNeighborhoodName()}, Istanbul\nMaterials: Shovel, gloves'
                : '';
            final bikeTourDescription = isBikeTourDay
                ? 'Bike Tour Event\nDate: $day ${_getMonthName()}\nHour: ${random.nextInt(24)}:00\nLocation: ${_getRandomForestName()}\nRoute Length: ${_getRandomRouteLength()} km\nWarnings: ${_getRandomSafetyPrecautions()}'
                : '';

            final isCurrentDay = day == DateTime.now().day && month == DateTime.now().month;

            return GestureDetector(
              onTap: () {
                if (hasEvent) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Event Details'),
                        content: Text(eventDescription),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('Close'),
                          ),
                        ],
                      );
                    },
                  );
                } else if (hasConference) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Conference Details'),
                        content: Text(conferenceDescription),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('Close'),
                          ),
                        ],
                      );
                    },
                  );
                } else if (isTreePlantingDay) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Event Details'),
                        content: Text(treePlantingDescription),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('Close'),
                          ),
                        ],
                      );
                    },
                  );
                } else if (isBikeTourDay) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Event Details'),
                        content: Text(bikeTourDescription),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('Close'),
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Event Not Found'),
                        content: Text('There are no events on the selected date.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('Close'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  color: hasEvent
                      ? Colors.green
                      : hasConference
                      ? Colors.blue
                      : isTreePlantingDay
                      ? Colors.yellow
                      : isBikeTourDay
                      ? Colors.red
                      : isCurrentDay
                      ? Colors.yellow
                      : Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      day.toString(),
                      style: TextStyle(
                        fontWeight: isCurrentDay ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                    if (hasEvent) Text('🗑️', style: TextStyle(fontSize: 24)),
                    if (hasConference) Text('📚', style: TextStyle(fontSize: 24)),
                    if (isTreePlantingDay) Text('🌳', style: TextStyle(fontSize: 24)),
                    if (isBikeTourDay) Text('🚲️', style: TextStyle(fontSize: 24)),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
  String _getRandomForestName() {
    final List<String> forestNames = [
      'Black Sea Forest',
      'Marmara Forest',
      'Central Anatolian Forest',
      'Mediterranean Forest',
      'Aegean Forest',
    ];
    final random = Random();
    return forestNames[random.nextInt(forestNames.length)];
  }

  int _getRandomRouteLength() {
    final random = Random();
    return random.nextInt(31) + 10; //a random number between 10 and 40
  }

  String _getRandomSafetyPrecautions() {
    final List<String> precautions = [
      'Dont forget to check the tyre pressures.',
      'Pay attention to the traffic rules.',
      'Dont forget to drink water and take frequent breaks.',
      'Before biking, check wheels, and pack repair kit & spare tire.',
      'Always wear helmet, knee pads, and elbow pads for biking.',
      'Adjust bike seat and handlebars to fit your body.',
      'Drink plenty of water before cycling and avoid eating heavy foods.',
      'Rest by taking breaks from time to time.',
    ];
    final random = Random();
    return precautions[random.nextInt(precautions.length)];
  }
  String _getRandomSubTopic() {
    final List<String> subTopics = [
      'Food Sustainability',
      'Worker Rights Sustainability',
      'Sustainability in Tourism',
      'Water Resources Sustainability',
      'Energy Sustainability',
    ];
    final random = Random();
    return subTopics[random.nextInt(subTopics.length)];
  }
  String _getRandomUniversityName() {
    final List<String> universities = [
      'Bogazici University',
      'Istanbul Technical University',
      'Middle East Technical University',
      'Hacettepe University',
      'Koç University',
    ];
    final random = Random();
    return universities[random.nextInt(universities.length)];
  }

  String _getRandomConferenceRoomName() {
    final List<String> conferenceRooms = [
      'White Hall',
      'Red Hall',
      'Blue Hall',
      'Green Hall',
      'Yellow Hall',
    ];
    final random = Random();
    return conferenceRooms[random.nextInt(conferenceRooms.length)];
  }

  String _getRandomSpeaker() {
    final List<String> companies = [
      'OpenAI',
      'Google',
      'Microsoft',
      'Amazon',
      'Apple',
    ];
    final List<String> titles = [
      'Prof. Dr.',
      'Dr.',
      'Doç. Dr.',
      'Yrd. Doç. Dr.',
      'Arş. Gör. Dr.',
    ];
    final List<String> names = [
      'Ahmet Yılmaz',
      'Mehmet Demir',
      'Ayşe Kaya',
      'Fatma Şahin',
      'Ali Aksoy',
    ];
    final random = Random();
    final company = companies[random.nextInt(companies.length)];
    final title = titles[random.nextInt(titles.length)];
    final name = names[random.nextInt(names.length)];
    return '$company - $title $name';
  }

  String _getRandomNeighborhoodName() {
    final List<String> neighborhoods = [
      'Kadıköy',
      'Beşiktaş',
      'Şişli',
      'Beyoğlu',
      'Karaköy',
    ];
    final random = Random();
    return neighborhoods[random.nextInt(neighborhoods.length)];
  }

  String _getRandomStreetName() {
    final List<String> streetNames = [
      'Istiklal Street',
      'Bagdat Street',
      'Abdi İpekçi Street',
      'Inönü Street',
      'Nişantaşı',
    ];
    final random = Random();
    return streetNames[random.nextInt(streetNames.length)];
  }
}

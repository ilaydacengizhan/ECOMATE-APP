import 'package:flutter/material.dart';

void main() {
  runApp(NoteApp());
}

class NoteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnaSayfa(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.green[600],
        scaffoldBackgroundColor: Colors.white,
      ),
    );
  }
}

class AnaSayfa extends StatefulWidget {
  @override
  _AnaSayfaState createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  String note = "";
  List<String> notes = [];

  @override
  void initState() {
    notes.add("recycling efficiency");
    notes.add("Separating waste");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "Sustainable Living Notebook",
          style: TextStyle(
            color: Colors.white,
            fontSize: 23,
            fontStyle: FontStyle.italic,
            letterSpacing: 1.5,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: Icon(
          Icons.add,
          color: Colors.green[600],
          size: 30,
        ),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: Colors.green[100],
                title: Text(
                  "Add Note",
                  style: TextStyle(color: Colors.black),
                ),
                content: TextField(
                  decoration: InputDecoration(
                    hintText: "Add your note here",
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (String value) {
                    setState(() {
                      note = value;
                    });
                  },
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        notes.add(note);
                      });
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "Add",
                      style: TextStyle(color: Colors.green[600]),
                    ),
                  )
                ],
              );
            },
          );
        },
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: notes.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              key: Key(notes[index]),
              child: Card(
                elevation: 4,
                margin: EdgeInsets.all(8),
                color: Colors.green[100],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ListTile(
                  title: Text(
                    notes[index],
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.delete_forever_rounded,
                      color: Colors.red[600],
                    ),
                    onPressed: () {
                      setState(() {
                        notes.removeAt(index);
                      });
                    },
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

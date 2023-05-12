import "package:flutter/material.dart";
import 'package:bmi_test/screen/result_screen.dart';
import 'package:bmi_test/constants.dart';
import 'package:flutter/material.dart';
import 'package:bmi_test/components/resable_card.dart';
import 'package:bmi_test/components/bottom_button.dart';
import 'package:share_plus/share_plus.dart';
import 'package:bmi_test/screen/database.dart';

class NoteList extends StatefulWidget {
  @override
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  final List<String> notes = [];

  void addNote() async {
    String newNote = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddNoteScreen()),
    );
    if (newNote != null) {
      setState(() {
        notes.add(newNote);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
      ),
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(notes[index]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => NoteDetail(notes[index])),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addNote,
        child: Icon(Icons.add),
      ),
    );
  }
}

class AddNoteScreen extends StatelessWidget {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Note'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _textController,
              autofocus: true,
              decoration: InputDecoration(
                hintText: 'Enter note text',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              child: Text('Save'),
              onPressed: () {
                String newNote = _textController.text.trim();
                Navigator.pop(context, newNote);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class NoteDetail extends StatelessWidget {
  final String note;

  NoteDetail(this.note);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Note Detail'),
      ),
      body: Center(
        child: Text(note),
      ),
    );
  }
}

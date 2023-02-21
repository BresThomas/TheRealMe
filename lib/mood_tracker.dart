import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class MoodSelectionRow extends StatefulWidget {
  @override
  _MoodSelectionRowState createState() => _MoodSelectionRowState();
}

class _MoodSelectionRowState extends State<MoodSelectionRow> {
  String _selectedMood = '';

  final databaseReference = FirebaseDatabase.instance.ref();

  void _selectMood(String mood) {
    setState(() {
      User? currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        String uid = currentUser.uid;
        _selectedMood = mood;
        // Add the selected mood to the database
        databaseReference.child('users/$uid/moods').push().set({
          'mood': _selectedMood,
          'timestamp': DateTime.now().millisecondsSinceEpoch
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tracker Mood")),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MoodButton(
              color: Colors.red,
              mood: 'Colère',
              selected: _selectedMood == 'Colère',
              onPressed: () => _selectMood('Colère'),
            ),
            MoodButton(
              color: Colors.yellow,
              mood: 'Joie',
              selected: _selectedMood == 'Joie',
              onPressed: () => _selectMood('Joie'),
            ),
            MoodButton(
              color: Colors.green,
              mood: 'Heureux',
              selected: _selectedMood == 'Heureux',
              onPressed: () => _selectMood('Heureux'),
            ),
            MoodButton(
              color: Colors.blue,
              mood: 'Triste',
              selected: _selectedMood == 'Triste',
              onPressed: () => _selectMood('Triste'),
            ),
            MoodButton(
              color: Colors.purple,
              mood: 'Fatigué',
              selected: _selectedMood == 'Fatigué',
              onPressed: () => _selectMood('Fatigué'),
            ),
          ],
        ),
      ),
    );
  }
}

class MoodButton extends StatelessWidget {
  final Color color;
  final String mood;
  final bool selected;
  final VoidCallback onPressed;

  const MoodButton({
    required this.color,
    required this.mood,
    required this.selected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: CircleAvatar(
        backgroundColor: color,
        child: selected ? Icon(Icons.check, color: Colors.white) : null,
      ),
    );
  }
}

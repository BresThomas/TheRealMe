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
      User? user = FirebaseAuth.instance.currentUser;
      int timestamp = DateTime.now().millisecondsSinceEpoch;

      FirebaseDatabase.instance
          .ref()
          .child("users")
          .child(user!.uid)
          .child("moods")
          .set({
        'mood': mood,
        'time': timestamp,
      });

      _selectedMood = mood;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tracker Mood")),
      body: Center(
        child: Wrap(
          spacing: 10.0,
          runSpacing: 10.0,
          children: [
            MoodButton(
              color: Color(0xFFFBF3100),
              mood: 'Colère',
              selected: _selectedMood == 'Colère',
              onPressed: () => _selectMood('Colère'),
            ),
            MoodButton(
              color: Color(0xFFFFCF70),
              mood: 'Joie',
              selected: _selectedMood == 'Joie',
              onPressed: () => _selectMood('Joie'),
            ),
            MoodButton(
              color: Color(0xFF499167),
              mood: 'Heureux',
              selected: _selectedMood == 'Heureux',
              onPressed: () => _selectMood('Heureux'),
            ),
            MoodButton(
              color: Color(0xFF084887),
              mood: 'Triste',
              selected: _selectedMood == 'Triste',
              onPressed: () => _selectMood('Triste'),
            ),
            MoodButton(
              color: Color(0xFF48284A),
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
      child: Chip(
        backgroundColor: color,
        label: Text(
          mood,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        labelPadding: EdgeInsets.symmetric(horizontal: 16.0),
        avatar: selected ? Icon(Icons.check, color: Colors.white) : null,
      ),
    );
  }
}

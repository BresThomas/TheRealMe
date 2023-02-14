import 'dart:async';

import 'package:flutter/material.dart';
import 'package:radar_charts_app/theme.dart';

class BreathingPage extends StatefulWidget {
  const BreathingPage({Key? key}) : super(key: key);

  @override
  _BreathingPageState createState() => _BreathingPageState();
}

class _BreathingPageState extends State<BreathingPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late String _text;
  late Timer _timer;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);

    _controller.repeat(reverse: true);

    _text = 'inhale';

    _timer = Timer.periodic(Duration(seconds: 4), (timer) {
      setState(() {
        _text = _text == 'inhale' ? 'exhale' : 'inhale';
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer.cancel(); // Stop the timer when the State object is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Page'),
      ),
      body: Center(
        child: Stack(
          children: [
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue[900],
              ),
            ),
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Transform.scale(
                  scale: 0.5 + _animation.value * 0.5,
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue[300],
                    ),
                    child: Center(
                      child: Text(
                        _text,
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

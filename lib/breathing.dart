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

  @override
  void initState() {
    super.initState();

    // Create an animation controller
    _controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    );

    // Create an animation that goes from 0 to 1
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);

    // Start the animation loop
    _controller.repeat(reverse: true);

    // Set the initial text
    _text = 'inhale';

    // Start a timer to change the text every 3 seconds
    Timer.periodic(Duration(seconds: 4), (timer) {
      setState(() {
        _text = _text == 'inhale' ? 'exhale' : 'inhale';
      });
    });
  }

  @override
  void dispose() {
    // Dispose of the animation controller
    _controller.dispose();
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
            // Dark blue circle at the center
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: CustomThemes.thirdColor,
              ),
            ),

            // Light blue animated circle on top of the dark blue circle
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
                      color: CustomThemes.primaryColor,
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

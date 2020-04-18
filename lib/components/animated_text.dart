import 'package:flutter/material.dart';

class NoTasksAnimatedText extends StatefulWidget {
  @override
  _NoTasksAnimatedTextState createState() => _NoTasksAnimatedTextState();
}

class _NoTasksAnimatedTextState extends State<NoTasksAnimatedText>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    final animation = Tween(begin: 0.0, end: 1.0).animate(controller);
    controller.forward();
    return FadeTransition(
      opacity: animation,
      child: Text(
        'All tasks completed! Add a new task by tapping on the + sign',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 30.0, color:Colors.white),
      ),
    );
  }
}

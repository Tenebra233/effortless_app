import 'package:flutter/material.dart';

class NoTasksAnimatedText extends StatefulWidget {
  @override
  _NoTasksAnimatedTextState createState() => _NoTasksAnimatedTextState();
}

class _NoTasksAnimatedTextState extends State<NoTasksAnimatedText>
    with TickerProviderStateMixin {
      AnimationController _controller;
      Animation _animation;

      @override
      void initState() { 
        super.initState();
        _controller = AnimationController(vsync: this, duration: Duration(seconds: 1));
        _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
      }
      @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
      
      
  @override
  Widget build(BuildContext context) {
    _controller.forward();
    return FadeTransition(
      opacity: _animation,
      child: Text(
        'All tasks completed! Add a new task by tapping on the + sign',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 30.0, color:Colors.white),
      ),
    );
  }
}

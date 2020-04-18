import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class AnimatedClock extends StatefulWidget {
  @override
  _AnimatedClockState createState() => _AnimatedClockState();
}

class _AnimatedClockState extends State<AnimatedClock>
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
      child: Container(
        margin: EdgeInsets.only(top:40.0),
        width: MediaQuery.of(context).size.width * 0.5,
        height: MediaQuery.of(context).size.width * 0.5,
        child: FlareActor("assets/Clock.flr",
            alignment: Alignment.center, animation: "Processing"),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class AnimatedClock extends StatefulWidget {
  @override
  _AnimatedClockState createState() => _AnimatedClockState();
}

class _AnimatedClockState extends State<AnimatedClock>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    final animation = Tween(begin: 0.0, end: 1.0).animate(controller);
    controller.forward();
    return FadeTransition(
      opacity: animation,
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

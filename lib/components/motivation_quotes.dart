import 'dart:math';

import 'package:flutter/material.dart';

class MotivationalQuotes extends StatefulWidget {
  @override
  _MotivationalQuotesState createState() => _MotivationalQuotesState();
}

class _MotivationalQuotesState extends State<MotivationalQuotes>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
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

    List<String> quotes = [
      '"Look up at the stars and not down at your feet. Try to make sense of what you see, and wonder about what makes the universe exist. Be curious." Stephen Hawking',
      '"With the new day comes new strength and new thoughts." Eleanor Roosevelt',
      '"Quality is not an act, it is a habit." Aristotle',
      '"Well done is better than well said." Benjamin Franklin',
      '"Good, better, best. Never let it rest. Til your good is better and your better is best." St. Jerome',
      '"Knowing is not enough; we must apply. Willing is not enough; we must do." Johann Wolfgang von Goethe',
      '"It does not matter how slowly you go as long as you do not stop." Confucius',
      '"The secret of getting ahead is getting started." Mark Twain',
    ];
    final _random = Random();
    int next(int min, int max) => min + _random.nextInt(max - min);

    return Container(
      margin: EdgeInsets.all(5.0),
      child: FadeTransition(
        opacity: _animation,
        child: Text(
          quotes[next(0, quotes.length)],
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

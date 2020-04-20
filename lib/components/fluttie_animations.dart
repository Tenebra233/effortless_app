import 'package:flutter/material.dart';
import 'package:fluttie/fluttie.dart';

class FluttieAnimationController extends StatelessWidget {
  final String path;
  FluttieAnimationController({this.path});
  createAnimation() async {
    var instance = Fluttie();
    var emojiComposition = await instance.loadAnimationFromAsset(
      path,
    );
    var emojiAnimation = await instance.prepareAnimation(emojiComposition);
    emojiAnimation.start();
    return emojiAnimation;
  }

  @override
  Widget build(BuildContext context) {
    createAnimation() {}
    return FluttieAnimation(
      createAnimation(),
    );
  }
}

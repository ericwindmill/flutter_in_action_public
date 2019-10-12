import 'package:flutter/material.dart';

class ColorTransitionText extends AnimatedWidget {
  final String text;
  final TextStyle style;

  ColorTransitionText({
    this.text,
    this.style,
    Key key,
    Animation<Color> animation,
  }) : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<Color> animation = listenable;
    return Text(
      text,
      style: style.copyWith(color: animation.value),
    );
  }
}

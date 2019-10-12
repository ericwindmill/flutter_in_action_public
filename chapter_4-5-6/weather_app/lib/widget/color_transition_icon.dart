import 'package:flutter/material.dart';

class ColorTransitionIcon extends AnimatedWidget {
  final IconData icon;
  final double size;

  ColorTransitionIcon({
    this.icon,
    this.size,
    Key key,
    Animation<Color> animation,
  }) : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<Color> animation = listenable;
    return Icon(
      icon,
      color: animation.value,
      size: size,
    );
  }
}

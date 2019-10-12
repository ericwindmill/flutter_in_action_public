import 'package:flutter/material.dart';

class ColorTransitionBox extends AnimatedWidget {
  final Widget child;

  ColorTransitionBox({
    this.child,
    Key key,
    Animation<Color> animation,
  }) : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<Color> animation = listenable;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: animation.value,
      ),
      child: child,
    );
  }
}

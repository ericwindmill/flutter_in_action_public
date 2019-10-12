import 'package:flutter/material.dart';

class TransitionAppbar extends AnimatedWidget {
  final Widget title;
  final Widget actionIcon;
  final Widget leadingAction;

  TransitionAppbar({
    this.title,
    this.actionIcon,
    this.leadingAction,
    Key key,
    Animation<Color> animation,
  }) : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<Color> animation = listenable;
    return AppBar(
      backgroundColor: animation.value,
      leading: leadingAction != null ? leadingAction : Container(),
      elevation: 0.0,
      bottomOpacity: 0.0,
      title: title,
      actions: <Widget>[actionIcon],
    );
  }
}

import 'package:flutter/material.dart';

class FadeTransitionPageRoute extends PageRouteBuilder {
  final Widget child;
  FadeTransitionPageRoute({
    required this.child,
  }) : super(pageBuilder: (context, animation, secondaryAnimation) => child);
  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}

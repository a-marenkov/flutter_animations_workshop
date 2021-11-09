import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'common/showcase_scaffold.dart';
import 'common/widgets.dart';

class ShowcaseAnimatedBouncy extends StatefulWidget {
  const ShowcaseAnimatedBouncy({
    Key? key,
  }) : super(key: key);

  @override
  _ShowcaseAnimatedBouncyState createState() => _ShowcaseAnimatedBouncyState();
}

class _ShowcaseAnimatedBouncyState extends State<ShowcaseAnimatedBouncy> {
  @override
  Widget build(BuildContext context) {
    return const ShowcaseScaffold(
      onRun: null,
      child: AnimatedBouncy(
        child: ColoredCircle(
          radius: 64,
          color: Colors.indigo,
        ),
      ),
    );
  }
}

class AnimatedBouncy extends StatefulWidget {
  final Widget child;

  const AnimatedBouncy({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  _AnimatedBouncyState createState() => _AnimatedBouncyState();
}

class _AnimatedBouncyState extends State<AnimatedBouncy> {
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

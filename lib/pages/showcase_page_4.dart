import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'common/showcase_config.dart';
import 'common/showcase_scaffold.dart';
import 'common/showcase_title.dart';
import 'common/widgets.dart';

/// Showcase of custom [AnimatedPulse]
class ShowcaseAnimatedPulse extends StatelessWidget {
  const ShowcaseAnimatedPulse({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final config = ShowcaseConfig.of(context);

    return ShowcaseScaffold(
      title: ShowcaseTitle.of(context),
      onRun: null,
      child: AnimatedPulse(
        radius: 24.0,
        color: Colors.red,
        duration: config.duration,
      ),
    );
  }
}

class AnimatedPulse extends StatefulWidget {
  final Duration duration;
  final Color color;
  final double radius;

  const AnimatedPulse({
    required this.color,
    required this.radius,
    required this.duration,
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AnimatedPulseState();
}

class _AnimatedPulseState extends State<AnimatedPulse> {
  @override
  Widget build(BuildContext context) {
    return ColoredCircle(
      radius: widget.radius,
      color: widget.color,
    );
  }
}

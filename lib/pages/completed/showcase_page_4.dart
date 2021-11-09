import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../common/showcase_config.dart';
import '../common/showcase_scaffold.dart';
import '../common/widgets.dart';

/// Showcase of custom [AnimatedPulse]
class ShowcaseAnimatedPulse extends StatelessWidget {
  const ShowcaseAnimatedPulse({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final config = ShowcaseConfig.of(context);

    return ShowcaseScaffold(
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

class _AnimatedPulseState extends State<AnimatedPulse>
    with SingleTickerProviderStateMixin {
  late final controller = AnimationController(
    duration: widget.duration,
    vsync: this,
  );

  late final innerUpscale = CurvedAnimation(
    parent: controller,
    curve: const Interval(0.0, 0.3, curve: Curves.easeIn),
  ).drive(Tween(begin: 1.0, end: 1.5));

  late final innerDownscale = CurvedAnimation(
    parent: controller,
    curve: const Interval(0.7, 1.0, curve: Curves.easeIn),
  ).drive(Tween(begin: 1.0, end: 1.0 / 1.5));

  late final innerScale = MultiplyAnimation(innerUpscale, innerDownscale);

  late final outerFade = Tween(begin: 1.0, end: 0.0).animate(controller);
  late final outerScale = Tween(begin: 1.0, end: 3.0).animate(controller);

  @override
  void initState() {
    super.initState();
    setDuration(widget.duration);
  }

  @override
  void didUpdateWidget(covariant AnimatedPulse oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.duration != oldWidget.duration) {
      setDuration(widget.duration);
    }
  }

  void setDuration(Duration duration) {
    controller.duration = duration;
    if (duration > Duration.zero) {
      controller.repeat();
    } else {
      controller.reset();
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FadeTransition(
          opacity: outerFade,
          child: ScaleTransition(
            scale: outerScale,
            child: ColoredCircle(
              radius: widget.radius,
              color: widget.color,
            ),
          ),
        ),
        ScaleTransition(
          scale: innerScale,
          child: ColoredCircle(
            radius: widget.radius,
            color: widget.color,
          ),
        )
      ],
    );
  }
}

class MultiplyAnimation extends CompoundAnimation<double> {
  MultiplyAnimation(
    Animation<double> first,
    Animation<double> next,
  ) : super(first: first, next: next);

  @override
  double get value => first.value * next.value;
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../common/showcase_config.dart';
import '../common/showcase_scaffold.dart';

/// Showcase of [AnimatedVisibility]
class ShowcaseAnimatedVisibility extends StatefulWidget {
  const ShowcaseAnimatedVisibility({
    Key? key,
  }) : super(key: key);

  @override
  _ShowcaseAnimatedVisibilityState createState() =>
      _ShowcaseAnimatedVisibilityState();
}

class _ShowcaseAnimatedVisibilityState
    extends State<ShowcaseAnimatedVisibility> {
  bool value = true;

  void onRun() {
    setState(() {
      value = !value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final config = ShowcaseConfig.of(context);

    return ShowcaseScaffold(
      onRun: onRun,
      child: AnimatedVisibility(
        duration: config.duration,
        curve: Curves.easeIn,
        isVisible: value,
        child: FloatingActionButton(
          child: const Icon(Icons.flutter_dash),
          onPressed: () {},
        ),
      ),
    );
  }
}

/// Animates visibility of the [child] by applying scale and fade transition
class AnimatedVisibility extends StatefulWidget {
  final Duration duration;
  final bool isVisible;
  final Widget child;
  final Curve curve;

  const AnimatedVisibility({
    Key? key,
    required this.child,
    required this.isVisible,
    required this.duration,
    this.curve = Curves.linear,
  }) : super(key: key);

  @override
  _AnimatedVisibilityState createState() => _AnimatedVisibilityState();
}

class _AnimatedVisibilityState extends State<AnimatedVisibility>
    with SingleTickerProviderStateMixin {
  late final controller = AnimationController(
    duration: widget.duration,
    value: widget.isVisible ? 1.0 : 0.0,
    vsync: this,
  );

  late final animation = CurvedAnimation(
    parent: controller,
    curve: widget.curve,
  );

  @override
  void didUpdateWidget(covariant AnimatedVisibility oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.duration != oldWidget.duration) {
      controller.duration = widget.duration;
    }
    if (widget.curve != oldWidget.curve) {
      animation.curve = widget.curve;
    }
    if (widget.isVisible != oldWidget.isVisible) {
      if (widget.isVisible) {
        controller.forward();
      } else {
        controller.reverse();
      }
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !widget.isVisible,
      child: ScaleTransition(
        scale: animation,
        child: FadeTransition(
          opacity: animation,
          child: widget.child,
        ),
      ),
    );
  }
}

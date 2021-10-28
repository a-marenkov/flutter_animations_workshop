import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'common/showcase_config.dart';
import 'common/showcase_scaffold.dart';
import 'common/showcase_title.dart';

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
      title: ShowcaseTitle.of(context),
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

class _AnimatedVisibilityState extends State<AnimatedVisibility> {
  @override
  Widget build(BuildContext context) {
    return widget.isVisible ? widget.child : const SizedBox.shrink();
  }
}

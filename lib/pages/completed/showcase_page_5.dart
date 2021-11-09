import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter/widgets.dart';

import '../common/showcase_scaffold.dart';
import '../common/showcase_utils.dart';
import '../common/widgets.dart';

/// Showcase of [AnimatedBouncy] usage
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

class _AnimatedBouncyState extends State<AnimatedBouncy>
    with SingleTickerProviderStateMixin {
  late final controller = AnimationController.unbounded(vsync: this);

  final tween = Tween(begin: Offset.zero, end: Offset.zero);

  late final animation = tween.animate(controller);

  var offset = Offset.zero;

  @override
  void initState() {
    super.initState();
    animation.addListener(() {
      setState(() {
        offset = animation.value;
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: offset,
      child: GestureDetector(
        onPanUpdate: (details) {
          controller.stop();
          setState(() {
            offset = offset.translate(details.delta.dx, details.delta.dy);
          });
        },
        onPanEnd: (details) {
          tween.begin = offset;
          controller.animateWith(
            SpringSimulation(
              SpringDescription.withDampingRatio(
                mass: 1.0,
                stiffness: PhysicsHelper.stiffness.medium,
                ratio: PhysicsHelper.dampingRatio.highBouncy,
              ),
              0.0,
              1.0,
              0.0,
              tolerance: PhysicsHelper.flingTolerance,
            ),
          );
        },
        child: widget.child,
      ),
    );
  }
}

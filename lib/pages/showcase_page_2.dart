import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'common/showcase_scaffold.dart';

/// Showcase of [TweenAnimationBuilder] usage
class ShowcaseTweenAnimationBuilder extends StatefulWidget {
  const ShowcaseTweenAnimationBuilder({
    Key? key,
  }) : super(key: key);

  @override
  _ShowcaseTweenAnimationBuilderState createState() =>
      _ShowcaseTweenAnimationBuilderState();
}

class _ShowcaseTweenAnimationBuilderState
    extends State<ShowcaseTweenAnimationBuilder> {
  var value = true;

  void toggle() {
    setState(() {
      value = !value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ShowcaseScaffold(
      onRun: toggle,
      child: value
          ? const Icon(
              Icons.arrow_upward_rounded,
              size: 56.0,
            )
          : const Icon(
              Icons.arrow_downward_rounded,
              size: 56.0,
            ),
    );
  }
}

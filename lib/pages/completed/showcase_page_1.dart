import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../strings.dart';
import '../common/showcase_config.dart';
import '../common/showcase_scaffold.dart';

/// Showcase of [AnimatedContainer] usage
class ShowcaseAnimatedContainer extends StatefulWidget {
  const ShowcaseAnimatedContainer({
    Key? key,
  }) : super(key: key);

  @override
  _ShowcaseAnimatedContainerState createState() =>
      _ShowcaseAnimatedContainerState();
}

class _ShowcaseAnimatedContainerState extends State<ShowcaseAnimatedContainer> {
  bool value = true;

  void toggle() {
    setState(() {
      value = !value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ShowcaseScaffold(
      onRun: toggle,
      child: AnimatedContainer(
        duration: ShowcaseConfig.of(context).duration,
        curve: Curves.easeIn,
        width: value ? 120.0 : 80.0,
        height: value ? 120.0 : 80.0,
        decoration: BoxDecoration(
          color: value ? Colors.cyan : Colors.grey.shade300,
          boxShadow: value
              ? [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    offset: const Offset(3.0, 3.0),
                    blurRadius: 3.0,
                    spreadRadius: 3.0,
                  ),
                ]
              : null,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            value ? Strings.on : Strings.off,
            style: Theme.of(context).primaryTextTheme.headline6,
          ),
        ),
      ),
    );
  }
}

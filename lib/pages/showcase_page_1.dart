import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../strings.dart';
import 'common/showcase_scaffold.dart';

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
      child: value
          ? Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.indigo,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    offset: const Offset(3.0, 3.0),
                    blurRadius: 3.0,
                    spreadRadius: 3.0,
                  ),
                ],
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  Strings.on,
                  style: Theme.of(context).primaryTextTheme.headline6,
                ),
              ),
            )
          : Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  Strings.off,
                  style: Theme.of(context).primaryTextTheme.headline6,
                ),
              ),
            ),
    );
  }
}

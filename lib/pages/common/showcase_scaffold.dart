import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animations_workshop/pages/common/showcase_title.dart';

import '../../strings.dart';

/// Generic page wrapper for animation showcase
class ShowcaseScaffold extends StatelessWidget {
  final Widget child;
  final VoidCallback? onRun;

  const ShowcaseScaffold({
    Key? key,
    required this.child,
    required this.onRun,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final btnStyle = ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          ShowcaseTitle.of(context),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(child: Center(child: child)),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: SizedBox(
                height: 64,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                          child: const Text(Strings.back),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          style: btnStyle),
                    ),
                    if (onRun != null) ...[
                      const SizedBox(width: 4.0),
                      Expanded(
                        child: ElevatedButton(
                            child: const Text(Strings.run),
                            onPressed: onRun,
                            style: btnStyle),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

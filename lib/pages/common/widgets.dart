import 'package:flutter/widgets.dart';

class ColoredCircle extends StatelessWidget {
  final double radius;
  final Color color;

  const ColoredCircle({
    required this.radius,
    required this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: SizedBox.fromSize(
        size: Size.fromRadius(radius),
      ),
    );
  }
}

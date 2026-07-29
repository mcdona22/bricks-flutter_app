import 'package:flutter/material.dart';

class CentredConstrainedWidget extends StatelessWidget {
  const CentredConstrainedWidget({
    required this.child,
    this.minWidth = 700.0,
    this.maxWidth = 800.0,
    super.key,
  });

  final double minWidth;
  final double maxWidth;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: ConstrainedBox(
        constraints: BoxConstraints(minWidth: minWidth, maxWidth: maxWidth),
        child: child,
      ),
    );
  }
}

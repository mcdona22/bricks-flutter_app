import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loggy/loggy.dart';

class CardWrapper extends HookConsumerWidget with UiLoggy {
  const CardWrapper({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      // Soft ambient shadow depth
      elevation: 2.0,
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
      // Clip behavior ensures the background color doesn't bleed past rounded borders
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Theme.of(context).primaryColor.withAlpha(30),
          // Subdued brand color
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(
          12.0,
        ), // Moderately rounded modern corners
      ),
      child: child,
    );
  }
}

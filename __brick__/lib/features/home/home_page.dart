import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loggy/loggy.dart';

class HomePage extends HookConsumerWidget with UiLoggy {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    loggy.info('Rendering HomePage baseline');

    return Scaffold(
      appBar: AppBar(
        title: const Text('{{app_name.titleCase()}}'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.rocket_launch_rounded,
              size: 64,
              color: Colors.deepPurple,
            ),
            const SizedBox(height: 16),
            Text(
              'Welcome to {{app_name.titleCase()}}',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            const Text('App scaffold initialized successfully.'),
          ],
        ),
      ),
    );
  }
}

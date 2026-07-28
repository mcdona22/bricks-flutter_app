import 'package:flutter/material.dart';
import 'package:flutter_loggy/flutter_loggy.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loggy/loggy.dart';

import 'features/home/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Loggy.initLoggy(logPrinter: const PrettyDeveloperPrinter());

  logInfo('🚀 Launching {{app_name.titleCase()}}');

  logInfo('Create Provider Container');
  final container = ProviderContainer(overrides: []);

  runApp(UncontrolledProviderScope(container: container, child: const App()));

  logInfo('🥳 {{app_name.titleCase()}} up and running');
}

class App extends HookConsumerWidget with UiLoggy {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: '{{app_name.titleCase()}}',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const HomePage(),
    );
  }
}

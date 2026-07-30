import 'package:flutter/material.dart';
import 'package:flutter_loggy/flutter_loggy.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loggy/loggy.dart';

import 'package:{{app_name.snakeCase()}}/core/routing/router.dart';
import 'package:{{app_name.snakeCase()}}/core/theme/themes.dart';

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
    return MaterialApp.router(
      title: '{{app_name.titleCase()}}',
      debugShowCheckedModeBanner: false,
      routerConfig: routerConfig,
      theme: ThemeData.from(colorScheme: lightColorScheme),
      darkTheme: ThemeData.from(colorScheme: darkColorScheme),
      themeMode: ThemeMode.dark,
    );
  }
}

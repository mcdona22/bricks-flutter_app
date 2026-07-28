import 'dart:io';
import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  final appName = context.vars['app_name'] as String;
  final org = context.vars['org'] as String? ?? 'com.example';
  final currentDir = Directory.current.path;
  final projectDir = '$currentDir/$appName';

  final progress = context.logger.progress(
    'Executing native flutter create...',
  );

  // 1. Run native flutter create
  final createResult = await Process.run(
      'flutter',
      [
        'create',
        '--org',
        org,
        '--platforms=ios,android,web,macos,linux,windows',
        appName,
      ],
      workingDirectory: currentDir);

  if (createResult.exitCode != 0) {
    progress.fail('flutter create failed: ${createResult.stderr}');
    return;
  }
  progress.complete('Native platform scaffold generated.');

  // --- NEW: Remove default flutter test directory ---
  final testDir = Directory('$projectDir/test');
  if (testDir.existsSync()) {
    testDir.deleteSync(recursive: true);
  }

  final overlayProgress = context.logger.progress(
    'Applying custom pubspec and architecture...',
  );

  // 2. Overwrite generated pubspec.yaml with your template pubspec.yaml
  final customPubspec = File('$currentDir/pubspec.yaml');
  if (customPubspec.existsSync()) {
    customPubspec.copySync('$projectDir/pubspec.yaml');
    customPubspec.deleteSync();
  }

  // 3. Overwrite generated lib/ directory with your template lib/
  final customLib = Directory('$currentDir/lib');
  final targetLib = Directory('$projectDir/lib');

  if (customLib.existsSync()) {
    if (targetLib.existsSync()) {
      targetLib.deleteSync(recursive: true);
    }
    await _copyDirectory(customLib, targetLib);
    customLib.deleteSync(recursive: true);
  }

  overlayProgress.complete('Custom overlay applied.');

  // 4. Fetch packages and format
  final pubGetProgress = context.logger.progress('Running flutter pub get...');
  await Process.run('flutter', ['pub', 'get'], workingDirectory: projectDir);
  await Process.run('dart', ['format', '.'], workingDirectory: projectDir);
  pubGetProgress.complete('Dependencies installed and code formatted.');

  context.logger.success('🚀 App $appName successfully scaffolded!');
}

Future<void> _copyDirectory(Directory source, Directory destination) async {
  await destination.create(recursive: true);
  await for (final entity in source.list(recursive: false)) {
    if (entity is Directory) {
      final newDir = Directory(
        '${destination.path}/${entity.path.split('/').last}',
      );
      await _copyDirectory(entity, newDir);
    } else if (entity is File) {
      await entity.copy('${destination.path}/${entity.path.split('/').last}');
    }
  }
}

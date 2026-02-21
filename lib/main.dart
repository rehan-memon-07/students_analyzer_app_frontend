import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_analyzer_app/core/router/app_router.dart';
import 'package:student_analyzer_app/core/theme/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/hive_flutter.dart'; // 👈 ADD THIS
import 'firebase_options.dart';
import 'core/data/local/hive_service.dart'; // 👈 ADD THIS

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // 👇 ADD THIS LINE ONLY
  await HiveService.init();

  runApp(
    const ProviderScope(
      child: StudentAnalyzerApp(),
    ),
  );
}

class StudentAnalyzerApp extends ConsumerWidget {
  const StudentAnalyzerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);
    final themeMode = ref.watch(themeModeProvider);

    return MaterialApp.router(
      title: 'Career Analyzer',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
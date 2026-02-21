import 'package:flutter/widgets.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';
import 'core/data/local/hive_service.dart';

Future<void> initializeApp() async {
  // Required before using async services
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Initialize Hive
  await HiveService.init();
}
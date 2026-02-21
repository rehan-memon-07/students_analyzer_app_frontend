import 'package:hive_flutter/hive_flutter.dart';
import '../../models/resume_model.dart';

class HiveService {

  static const String resumeBox = "resumeBox";

  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(ResumeModelAdapter());
    await Hive.openBox<ResumeModel>(resumeBox);
  }
}

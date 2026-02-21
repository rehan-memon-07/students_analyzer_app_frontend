import 'package:hive/hive.dart';
import '../../models/resume_model.dart';
import 'hive_service.dart';

class ResumeLocalDataSource {
  final Box<ResumeModel> box =
  Hive.box<ResumeModel>(HiveService.resumeBox);

  Future<void> saveResume(ResumeModel resume) async {
    await box.put(resume.id, resume);
  }

  List<ResumeModel> getAllResumes() {
    return box.values.toList();
  }

  ResumeModel? getResume(String id) {
    return box.get(id);
  }

  Future<void> deleteResume(String id) async {
    await box.delete(id);
  }
}
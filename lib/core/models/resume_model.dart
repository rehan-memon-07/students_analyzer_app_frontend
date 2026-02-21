import 'package:hive/hive.dart';

part 'resume_model.g.dart';

@HiveType(typeId: 0)
class ResumeModel extends HiveObject {

  @HiveField(0)
  String id;

  @HiveField(1)
  String filePath;

  @HiveField(2)
  int score;

  @HiveField(3)
  Map<String, dynamic> parsedData;

  @HiveField(4)
  int version;

  @HiveField(5)
  DateTime createdAt;

  ResumeModel({
    required this.id,
    required this.filePath,
    required this.score,
    required this.parsedData,
    required this.version,
    required this.createdAt,
  });
}
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resume_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ResumeModelAdapter extends TypeAdapter<ResumeModel> {
  @override
  final int typeId = 0;

  @override
  ResumeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ResumeModel(
      id: fields[0] as String,
      filePath: fields[1] as String,
      score: fields[2] as int,
      parsedData: (fields[3] as Map).cast<String, dynamic>(),
      version: fields[4] as int,
      createdAt: fields[5] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, ResumeModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.filePath)
      ..writeByte(2)
      ..write(obj.score)
      ..writeByte(3)
      ..write(obj.parsedData)
      ..writeByte(4)
      ..write(obj.version)
      ..writeByte(5)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ResumeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

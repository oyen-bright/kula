// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_storage_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalStorageModelAdapter extends TypeAdapter<LocalStorageModel> {
  @override
  final int typeId = 1;

  @override
  LocalStorageModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalStorageModel()
      ..accessToken = fields[0] as ({String access, String refresh})?
      ..termsOfUse = fields[1] as String?
      ..privacyPolicy = fields[2] as String?;
  }

  @override
  void write(BinaryWriter writer, LocalStorageModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.accessToken)
      ..writeByte(1)
      ..write(obj.termsOfUse)
      ..writeByte(2)
      ..write(obj.privacyPolicy);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalStorageModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

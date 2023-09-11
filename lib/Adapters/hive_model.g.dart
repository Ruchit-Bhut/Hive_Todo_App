// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../Models/hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

// ignore: public_member_api_docs
class PersonDetailsAdapter extends TypeAdapter<PersonDetails> {
  @override
  final int typeId = 1;

  @override
  PersonDetails read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PersonDetails(
      firstname: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PersonDetails obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.firstname);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PersonDetailsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

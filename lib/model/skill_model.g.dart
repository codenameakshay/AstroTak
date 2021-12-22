// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skill_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Skills _$SkillsFromJson(Map<String, dynamic> json) => Skills(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$SkillsToJson(Skills instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
    };

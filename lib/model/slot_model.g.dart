// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slot_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Slot _$SlotFromJson(Map<String, dynamic> json) => Slot(
      toFormat: json['toFormat'] as String,
      fromFormat: json['fromFormat'] as String,
      from: json['from'] as String,
      to: json['to'] as String,
    );

Map<String, dynamic> _$SlotToJson(Slot instance) => <String, dynamic>{
      'toFormat': instance.toFormat,
      'fromFormat': instance.fromFormat,
      'from': instance.from,
      'to': instance.to,
    };

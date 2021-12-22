// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'availability_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Availability _$AvailabilityFromJson(Map<String, dynamic> json) => Availability(
      days: (json['days'] as List<dynamic>).map((e) => e as String).toList(),
      slot: Slot.fromJson(json['slot'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AvailabilityToJson(Availability instance) =>
    <String, dynamic>{
      'days': instance.days,
      'slot': instance.slot.toJson(),
    };

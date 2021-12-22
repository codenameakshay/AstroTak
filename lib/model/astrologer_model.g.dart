// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'astrologer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Astrologer _$AstrologerFromJson(Map<String, dynamic> json) => Astrologer(
      id: json['id'] as int,
      urlSlug: json['urlSlug'] as String?,
      namePrefix: json['namePrefix'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      aboutMe: json['aboutMe'] as String?,
      profliePicUrl: json['profliePicUrl'] as String?,
      experience: json['experience'] as int?,
      languages: (json['languages'] as List<dynamic>?)
          ?.map((e) => Languages.fromJson(e as Map<String, dynamic>))
          .toList(),
      minimumCallDuration: json['minimumCallDuration'] as int?,
      minimumCallDurationCharges: json['minimumCallDurationCharges'] as int?,
      additionalPerMinuteCharges: json['additionalPerMinuteCharges'] as int?,
      isAvailable: json['isAvailable'] as bool?,
      rating: (json['rating'] as num?)?.toDouble(),
      skills: (json['skills'] as List<dynamic>?)
          ?.map((e) => Skills.fromJson(e as Map<String, dynamic>))
          .toList(),
      isOnCall: json['isOnCall'] as bool?,
      freeMinutes: json['freeMinutes'] as int?,
      additionalMinute: json['additionalMinute'] as int?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => Images.fromJson(e as Map<String, dynamic>))
          .toList(),
      availability: json['availability'] == null
          ? null
          : Availability.fromJson(json['availability'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AstrologerToJson(Astrologer instance) =>
    <String, dynamic>{
      'id': instance.id,
      'urlSlug': instance.urlSlug,
      'namePrefix': instance.namePrefix,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'aboutMe': instance.aboutMe,
      'profliePicUrl': instance.profliePicUrl,
      'experience': instance.experience,
      'languages': instance.languages?.map((e) => e.toJson()).toList(),
      'minimumCallDuration': instance.minimumCallDuration,
      'minimumCallDurationCharges': instance.minimumCallDurationCharges,
      'additionalPerMinuteCharges': instance.additionalPerMinuteCharges,
      'isAvailable': instance.isAvailable,
      'rating': instance.rating,
      'skills': instance.skills?.map((e) => e.toJson()).toList(),
      'isOnCall': instance.isOnCall,
      'freeMinutes': instance.freeMinutes,
      'additionalMinute': instance.additionalMinute,
      'images': instance.images?.map((e) => e.toJson()).toList(),
      'availability': instance.availability?.toJson(),
    };
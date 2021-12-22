import 'package:astrotak/model/availability_model.dart';
import 'package:astrotak/model/image_model.dart';
import 'package:astrotak/model/language_model.dart';
import 'package:astrotak/model/skill_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'astrologer_model.g.dart';

@JsonSerializable(
  explicitToJson: true,
)
class Astrologer {
  int id;
  String? urlSlug;
  String? namePrefix;
  String? firstName;
  String? lastName;
  String? aboutMe;
  String? profliePicUrl;
  int? experience;
  List<Languages>? languages;
  int? minimumCallDuration;
  int? minimumCallDurationCharges;
  int? additionalPerMinuteCharges;
  bool? isAvailable;
  double? rating;
  List<Skills>? skills;
  bool? isOnCall;
  int? freeMinutes;
  int? additionalMinute;
  List<Images>? images;
  Availability? availability;

  Astrologer(
      {required this.id,
      this.urlSlug,
      this.namePrefix,
      this.firstName,
      this.lastName,
      this.aboutMe,
      this.profliePicUrl,
      this.experience,
      this.languages,
      this.minimumCallDuration,
      this.minimumCallDurationCharges,
      this.additionalPerMinuteCharges,
      this.isAvailable,
      this.rating,
      this.skills,
      this.isOnCall,
      this.freeMinutes,
      this.additionalMinute,
      this.images,
      this.availability});

  factory Astrologer.fromJson(Map<String, dynamic> json) =>
      _$AstrologerFromJson(json);
  Map<String, dynamic> toJson() => _$AstrologerToJson(this);
}

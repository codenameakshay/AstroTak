import 'package:json_annotation/json_annotation.dart';

part 'skill_model.g.dart';

@JsonSerializable(
  explicitToJson: true,
)
class Skills {
  int id;
  String name;
  String? description;

  Skills({required this.id, required this.name, this.description});

  factory Skills.fromJson(Map<String, dynamic> json) => _$SkillsFromJson(json);
  Map<String, dynamic> toJson() => _$SkillsToJson(this);
}

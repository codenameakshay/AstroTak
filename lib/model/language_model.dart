import 'package:json_annotation/json_annotation.dart';

part 'language_model.g.dart';

@JsonSerializable(
  explicitToJson: true,
)
class Languages {
  int id;
  String name;

  Languages({required this.id, required this.name});

  factory Languages.fromJson(Map<String, dynamic> json) =>
      _$LanguagesFromJson(json);
  Map<String, dynamic> toJson() => _$LanguagesToJson(this);
}

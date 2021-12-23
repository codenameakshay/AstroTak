import 'package:json_annotation/json_annotation.dart';

part 'image_model.g.dart';

@JsonSerializable(
  explicitToJson: true,
)
class Images {
  String? imageUrl;
  int? id;

  Images({this.imageUrl, this.id});

  factory Images.fromJson(Map<String, dynamic> json) => _$ImagesFromJson(json);
  Map<String, dynamic> toJson() => _$ImagesToJson(this);
}

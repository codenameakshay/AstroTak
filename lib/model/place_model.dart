import 'package:json_annotation/json_annotation.dart';

part 'place_model.g.dart';

@JsonSerializable(
  explicitToJson: true,
)
class Place {
  String placeName;
  String placeId;

  Place({required this.placeName, required this.placeId});

  factory Place.fromJson(Map<String, dynamic> json) => _$PlaceFromJson(json);
  Map<String, dynamic> toJson() => _$PlaceToJson(this);
}

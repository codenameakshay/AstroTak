import 'package:astrotak/model/slot_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'availability_model.g.dart';

@JsonSerializable(
  explicitToJson: true,
)
class Availability {
  List<String> days;
  Slot slot;

  Availability({required this.days, required this.slot});

  factory Availability.fromJson(Map<String, dynamic> json) =>
      _$AvailabilityFromJson(json);
  Map<String, dynamic> toJson() => _$AvailabilityToJson(this);
}

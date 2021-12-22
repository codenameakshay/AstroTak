import 'package:json_annotation/json_annotation.dart';

part 'slot_model.g.dart';

@JsonSerializable(
  explicitToJson: true,
)
class Slot {
  String toFormat;
  String fromFormat;
  String from;
  String to;

  Slot(
      {required this.toFormat,
      required this.fromFormat,
      required this.from,
      required this.to});

  factory Slot.fromJson(Map<String, dynamic> json) => _$SlotFromJson(json);
  Map<String, dynamic> toJson() => _$SlotToJson(this);
}

import 'package:json_annotation/json_annotation.dart';

part 'panchang_model.g.dart';

@JsonSerializable(
  explicitToJson: true,
)
class Panchang {
  String day;
  String sunrise;
  String sunset;
  String moonrise;
  String moonset;
  String? vedicSunrise;
  String? vedicSunset;
  Tithi? tithi;
  Tithi? nakshatra;
  Tithi? yog;
  Tithi? karan;
  HinduMaah? hinduMaah;
  String? paksha;
  String? ritu;
  String? sunSign;
  String? moonSign;
  String? ayana;
  String? panchangYog;
  double? vikramSamvat;
  double? shakaSamvat;
  String? vkramSamvatName;
  String? shakaSamvatName;
  String? dishaShool;
  String? dishaShoolRemedies;
  NakShool? nakShool;
  String? moonNivas;
  AbhijitMuhurta? abhijitMuhurta;
  AbhijitMuhurta? rahukaal;
  AbhijitMuhurta? guliKaal;
  AbhijitMuhurta? yamghantKaal;

  Panchang(
      {required this.day,
      required this.sunrise,
      required this.sunset,
      required this.moonrise,
      required this.moonset,
      this.vedicSunrise,
      this.vedicSunset,
      this.tithi,
      this.nakshatra,
      this.yog,
      this.karan,
      this.hinduMaah,
      this.paksha,
      this.ritu,
      this.sunSign,
      this.moonSign,
      this.ayana,
      this.panchangYog,
      this.vikramSamvat,
      this.shakaSamvat,
      this.vkramSamvatName,
      this.shakaSamvatName,
      this.dishaShool,
      this.dishaShoolRemedies,
      this.nakShool,
      this.moonNivas,
      this.abhijitMuhurta,
      this.rahukaal,
      this.guliKaal,
      this.yamghantKaal});

  factory Panchang.fromJson(Map<String, dynamic> json) =>
      _$PanchangFromJson(json);
  Map<String, dynamic> toJson() => _$PanchangToJson(this);
}

@JsonSerializable(
  explicitToJson: true,
)
class Tithi {
  Map<String, dynamic>? details;
  EndTime? endTime;
  int? endTimeMs;

  Tithi({this.details, this.endTime, this.endTimeMs});

  factory Tithi.fromJson(Map<String, dynamic> json) => _$TithiFromJson(json);
  Map<String, dynamic> toJson() => _$TithiToJson(this);
}

@JsonSerializable(
  explicitToJson: true,
)
class EndTime {
  int hour;
  int minute;
  int second;

  EndTime({required this.hour, required this.minute, required this.second});

  factory EndTime.fromJson(Map<String, dynamic> json) =>
      _$EndTimeFromJson(json);
  Map<String, dynamic> toJson() => _$EndTimeToJson(this);
}

@JsonSerializable(
  explicitToJson: true,
)
class HinduMaah {
  bool adhikStatus;
  String purnimanta;
  String amanta;
  int amantaId;
  int purnimantaId;

  HinduMaah(
      {required this.adhikStatus,
      required this.purnimanta,
      required this.amanta,
      required this.amantaId,
      required this.purnimantaId});

  factory HinduMaah.fromJson(Map<String, dynamic> json) =>
      _$HinduMaahFromJson(json);
  Map<String, dynamic> toJson() => _$HinduMaahToJson(this);
}

@JsonSerializable(
  explicitToJson: true,
)
class NakShool {
  String direction;
  String remedies;

  NakShool({required this.direction, required this.remedies});

  factory NakShool.fromJson(Map<String, dynamic> json) =>
      _$NakShoolFromJson(json);
  Map<String, dynamic> toJson() => _$NakShoolToJson(this);
}

@JsonSerializable(
  explicitToJson: true,
)
class AbhijitMuhurta {
  String start;
  String end;

  AbhijitMuhurta({required this.start, required this.end});

  factory AbhijitMuhurta.fromJson(Map<String, dynamic> json) =>
      _$AbhijitMuhurtaFromJson(json);
  Map<String, dynamic> toJson() => _$AbhijitMuhurtaToJson(this);
}

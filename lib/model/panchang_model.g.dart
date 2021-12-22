// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'panchang_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Panchang _$PanchangFromJson(Map<String, dynamic> json) => Panchang(
      day: json['day'] as String,
      sunrise: json['sunrise'] as String,
      sunset: json['sunset'] as String,
      moonrise: json['moonrise'] as String,
      moonset: json['moonset'] as String,
      vedicSunrise: json['vedicSunrise'] as String,
      vedicSunset: json['vedicSunset'] as String,
      tithi: Tithi.fromJson(json['tithi'] as Map<String, dynamic>),
      nakshatra: Tithi.fromJson(json['nakshatra'] as Map<String, dynamic>),
      yog: Tithi.fromJson(json['yog'] as Map<String, dynamic>),
      karan: Tithi.fromJson(json['karan'] as Map<String, dynamic>),
      hinduMaah: HinduMaah.fromJson(json['hinduMaah'] as Map<String, dynamic>),
      paksha: json['paksha'] as String,
      ritu: json['ritu'] as String,
      sunSign: json['sunSign'] as String,
      moonSign: json['moonSign'] as String,
      ayana: json['ayana'] as String,
      panchangYog: json['panchangYog'] as String,
      vikramSamvat: json['vikramSamvat'] as int,
      shakaSamvat: json['shakaSamvat'] as int,
      vkramSamvatName: json['vkramSamvatName'] as String,
      shakaSamvatName: json['shakaSamvatName'] as String,
      dishaShool: json['dishaShool'] as String,
      dishaShoolRemedies: json['dishaShoolRemedies'] as String,
      nakShool: NakShool.fromJson(json['nakShool'] as Map<String, dynamic>),
      moonNivas: json['moonNivas'] as String,
      abhijitMuhurta: AbhijitMuhurta.fromJson(
          json['abhijitMuhurta'] as Map<String, dynamic>),
      rahukaal:
          AbhijitMuhurta.fromJson(json['rahukaal'] as Map<String, dynamic>),
      guliKaal:
          AbhijitMuhurta.fromJson(json['guliKaal'] as Map<String, dynamic>),
      yamghantKaal:
          AbhijitMuhurta.fromJson(json['yamghantKaal'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PanchangToJson(Panchang instance) => <String, dynamic>{
      'day': instance.day,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
      'moonrise': instance.moonrise,
      'moonset': instance.moonset,
      'vedicSunrise': instance.vedicSunrise,
      'vedicSunset': instance.vedicSunset,
      'tithi': instance.tithi.toJson(),
      'nakshatra': instance.nakshatra.toJson(),
      'yog': instance.yog.toJson(),
      'karan': instance.karan.toJson(),
      'hinduMaah': instance.hinduMaah.toJson(),
      'paksha': instance.paksha,
      'ritu': instance.ritu,
      'sunSign': instance.sunSign,
      'moonSign': instance.moonSign,
      'ayana': instance.ayana,
      'panchangYog': instance.panchangYog,
      'vikramSamvat': instance.vikramSamvat,
      'shakaSamvat': instance.shakaSamvat,
      'vkramSamvatName': instance.vkramSamvatName,
      'shakaSamvatName': instance.shakaSamvatName,
      'dishaShool': instance.dishaShool,
      'dishaShoolRemedies': instance.dishaShoolRemedies,
      'nakShool': instance.nakShool.toJson(),
      'moonNivas': instance.moonNivas,
      'abhijitMuhurta': instance.abhijitMuhurta.toJson(),
      'rahukaal': instance.rahukaal.toJson(),
      'guliKaal': instance.guliKaal.toJson(),
      'yamghantKaal': instance.yamghantKaal.toJson(),
    };

Tithi _$TithiFromJson(Map<String, dynamic> json) => Tithi(
      details: json['details'] as Map<String, dynamic>,
      endTime: EndTime.fromJson(json['endTime'] as Map<String, dynamic>),
      endTimeMs: json['endTimeMs'] as int,
    );

Map<String, dynamic> _$TithiToJson(Tithi instance) => <String, dynamic>{
      'details': instance.details,
      'endTime': instance.endTime.toJson(),
      'endTimeMs': instance.endTimeMs,
    };

EndTime _$EndTimeFromJson(Map<String, dynamic> json) => EndTime(
      hour: json['hour'] as int,
      minute: json['minute'] as int,
      second: json['second'] as int,
    );

Map<String, dynamic> _$EndTimeToJson(EndTime instance) => <String, dynamic>{
      'hour': instance.hour,
      'minute': instance.minute,
      'second': instance.second,
    };

HinduMaah _$HinduMaahFromJson(Map<String, dynamic> json) => HinduMaah(
      adhikStatus: json['adhikStatus'] as bool,
      purnimanta: json['purnimanta'] as String,
      amanta: json['amanta'] as String,
      amantaId: json['amantaId'] as int,
      purnimantaId: json['purnimantaId'] as int,
    );

Map<String, dynamic> _$HinduMaahToJson(HinduMaah instance) => <String, dynamic>{
      'adhikStatus': instance.adhikStatus,
      'purnimanta': instance.purnimanta,
      'amanta': instance.amanta,
      'amantaId': instance.amantaId,
      'purnimantaId': instance.purnimantaId,
    };

NakShool _$NakShoolFromJson(Map<String, dynamic> json) => NakShool(
      direction: json['direction'] as String,
      remedies: json['remedies'] as String,
    );

Map<String, dynamic> _$NakShoolToJson(NakShool instance) => <String, dynamic>{
      'direction': instance.direction,
      'remedies': instance.remedies,
    };

AbhijitMuhurta _$AbhijitMuhurtaFromJson(Map<String, dynamic> json) =>
    AbhijitMuhurta(
      start: json['start'] as String,
      end: json['end'] as String,
    );

Map<String, dynamic> _$AbhijitMuhurtaToJson(AbhijitMuhurta instance) =>
    <String, dynamic>{
      'start': instance.start,
      'end': instance.end,
    };

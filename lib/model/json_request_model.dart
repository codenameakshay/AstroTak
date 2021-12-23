import 'package:json_annotation/json_annotation.dart';

part 'json_request_model.g.dart';

@JsonSerializable(
  explicitToJson: true,
)
class JSONRequest {
  String httpStatus;
  int httpStatusCode;
  bool success;
  String message;
  String apiName;
  dynamic data;

  JSONRequest({
    required this.httpStatus,
    required this.httpStatusCode,
    required this.success,
    required this.message,
    required this.apiName,
    required this.data,
  });

  factory JSONRequest.fromJson(Map<String, dynamic> json) =>
      _$JSONRequestFromJson(json);
  Map<String, dynamic> toJson() => _$JSONRequestToJson(this);
}

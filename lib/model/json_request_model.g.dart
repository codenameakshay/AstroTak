// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'json_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JSONRequest _$JSONRequestFromJson(Map<String, dynamic> json) => JSONRequest(
      httpStatus: json['httpStatus'] as String,
      httpStatusCode: json['httpStatusCode'] as int,
      success: json['success'] as bool,
      message: json['message'] as String,
      apiName: json['apiName'] as String,
      data: json['data'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$JSONRequestToJson(JSONRequest instance) =>
    <String, dynamic>{
      'httpStatus': instance.httpStatus,
      'httpStatusCode': instance.httpStatusCode,
      'success': instance.success,
      'message': instance.message,
      'apiName': instance.apiName,
      'data': instance.data,
    };

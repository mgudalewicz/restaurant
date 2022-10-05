// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'soup_write_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SoupWriteRequest _$SoupWriteRequestFromJson(Map<String, dynamic> json) =>
    SoupWriteRequest(
      prize: (json['prize'] as num).toDouble(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$SoupWriteRequestToJson(SoupWriteRequest instance) =>
    <String, dynamic>{
      'prize': instance.prize,
      'name': instance.name,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drink_write_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DrinkWriteRequest _$DrinkWriteRequestFromJson(Map<String, dynamic> json) =>
    DrinkWriteRequest(
      prize: (json['prize'] as num).toDouble(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$DrinkWriteRequestToJson(DrinkWriteRequest instance) =>
    <String, dynamic>{
      'prize': instance.prize,
      'name': instance.name,
    };

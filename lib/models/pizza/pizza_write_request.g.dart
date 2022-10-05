// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pizza_write_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PizzaWriteRequest _$PizzaWriteRequestFromJson(Map<String, dynamic> json) =>
    PizzaWriteRequest(
      prize: (json['prize'] as num).toDouble(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$PizzaWriteRequestToJson(PizzaWriteRequest instance) =>
    <String, dynamic>{
      'prize': instance.prize,
      'name': instance.name,
    };

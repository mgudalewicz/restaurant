// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'extra_write_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExtraWriteRequest _$ExtraWriteRequestFromJson(Map<String, dynamic> json) =>
    ExtraWriteRequest(
      prize: (json['prize'] as num).toDouble(),
      name: json['name'] as String,
      category: json['category'] as String,
      subcategory: json['subcategory'] as String,
    );

Map<String, dynamic> _$ExtraWriteRequestToJson(ExtraWriteRequest instance) =>
    <String, dynamic>{
      'prize': instance.prize,
      'name': instance.name,
      'category': instance.category,
      'subcategory': instance.subcategory,
    };

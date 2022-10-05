// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'extra.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Extra _$ExtraFromJson(Map<String, dynamic> json) => Extra(
      id: json['id'] as String,
      prize: (json['prize'] as num).toDouble(),
      name: json['name'] as String,
      category: json['category'] as String,
      subcategory: json['subcategory'] as String,
    );

Map<String, dynamic> _$ExtraToJson(Extra instance) => <String, dynamic>{
      'id': instance.id,
      'prize': instance.prize,
      'name': instance.name,
      'category': instance.category,
      'subcategory': instance.subcategory,
    };

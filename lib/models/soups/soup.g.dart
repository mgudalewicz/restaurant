// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'soup.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Soup _$SoupFromJson(Map<String, dynamic> json) => Soup(
      id: json['id'] as String,
      prize: (json['prize'] as num).toDouble(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$SoupToJson(Soup instance) => <String, dynamic>{
      'id': instance.id,
      'prize': instance.prize,
      'name': instance.name,
    };

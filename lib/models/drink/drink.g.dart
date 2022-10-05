// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drink.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Drink _$DrinkFromJson(Map<String, dynamic> json) => Drink(
      id: json['id'] as String,
      prize: (json['prize'] as num).toDouble(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$DrinkToJson(Drink instance) => <String, dynamic>{
      'id': instance.id,
      'prize': instance.prize,
      'name': instance.name,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pizza.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pizza _$PizzaFromJson(Map<String, dynamic> json) => Pizza(
      id: json['id'] as String,
      prize: (json['prize'] as num).toDouble(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$PizzaToJson(Pizza instance) => <String, dynamic>{
      'id': instance.id,
      'prize': instance.prize,
      'name': instance.name,
    };

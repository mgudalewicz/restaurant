// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'extra.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Extra _$ExtraFromJson(Map<String, dynamic> json) => Extra(
      id: json['id'] as String,
      prize: (json['prize'] as num).toDouble(),
      name: json['name'] as String,
      category: $enumDecode(_$DishEnumMap, json['category']),
      subcategory: json['subcategory'] as String,
    );

Map<String, dynamic> _$ExtraToJson(Extra instance) => <String, dynamic>{
      'id': instance.id,
      'prize': instance.prize,
      'name': instance.name,
      'category': _$DishEnumMap[instance.category]!,
      'subcategory': instance.subcategory,
    };

const _$DishEnumMap = {
  Dish.drinks: 'drinks',
  Dish.maincourse: 'main_course',
  Dish.pizza: 'pizza',
  Dish.soups: 'soups',
};

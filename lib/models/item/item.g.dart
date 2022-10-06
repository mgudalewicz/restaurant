// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
      id: json['id'] as String,
      prize: (json['prize'] as num).toDouble(),
      name: json['name'] as String,
      category: $enumDecode(_$DishEnumMap, json['category']),
    );

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'id': instance.id,
      'prize': instance.prize,
      'name': instance.name,
      'category': _$DishEnumMap[instance.category]!,
    };

const _$DishEnumMap = {
  Dish.drinks: 'drinks',
  Dish.maincourse: 'main_course',
  Dish.pizza: 'pizza',
  Dish.soups: 'soups',
};

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_write_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemWriteRequest _$ItemWriteRequestFromJson(Map<String, dynamic> json) =>
    ItemWriteRequest(
      prize: (json['prize'] as num).toDouble(),
      name: json['name'] as String,
      category: $enumDecode(_$DishEnumMap, json['category']),
    );

Map<String, dynamic> _$ItemWriteRequestToJson(ItemWriteRequest instance) =>
    <String, dynamic>{
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

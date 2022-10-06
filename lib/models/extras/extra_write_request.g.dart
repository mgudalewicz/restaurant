// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'extra_write_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExtraWriteRequest _$ExtraWriteRequestFromJson(Map<String, dynamic> json) => ExtraWriteRequest(
      prize: (json['prize'] as num).toDouble(),
      name: json['name'] as String,
      category: $enumDecode(_$DishEnumMap, json['category']),
      subcategory: json['subcategory'] as String,
    );

Map<String, dynamic> _$ExtraWriteRequestToJson(ExtraWriteRequest instance) => <String, dynamic>{
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

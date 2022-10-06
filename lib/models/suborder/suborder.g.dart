// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suborder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Suborder _$SuborderFromJson(Map<String, dynamic> json) => Suborder(
      id: json['id'] as String,
      prize: (json['prize'] as num).toDouble(),
      itemId: json['item_id'] as String,
      orderId: json['order_id'] as String,
      amount: json['amount'] as int,
      extrasId: (json['extras_id'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
    );

Map<String, dynamic> _$SuborderToJson(Suborder instance) => <String, dynamic>{
      'id': instance.id,
      'prize': instance.prize,
      'item_id': instance.itemId,
      'order_id': instance.orderId,
      'amount': instance.amount,
      'extras_id': instance.extrasId,
    };

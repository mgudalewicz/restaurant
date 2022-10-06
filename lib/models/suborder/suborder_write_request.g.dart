// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suborder_write_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuborderWriteRequest _$SuborderWriteRequestFromJson(
        Map<String, dynamic> json) =>
    SuborderWriteRequest(
      prize: (json['prize'] as num).toDouble(),
      itemId: json['item_id'] as String,
      orderId: json['order_id'] as String,
      amount: json['amount'] as int,
      extrasId: (json['extras_id'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
    );

Map<String, dynamic> _$SuborderWriteRequestToJson(
        SuborderWriteRequest instance) =>
    <String, dynamic>{
      'prize': instance.prize,
      'item_id': instance.itemId,
      'order_id': instance.orderId,
      'amount': instance.amount,
      'extras_id': instance.extrasId,
    };

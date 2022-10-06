// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      id: json['id'] as String,
      prize: (json['prize'] as num).toDouble(),
      inProgress: json['in_progress'] as bool,
      userId: json['user_id'] as String,
    );

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'id': instance.id,
      'prize': instance.prize,
      'in_progress': instance.inProgress,
      'user_id': instance.userId,
    };

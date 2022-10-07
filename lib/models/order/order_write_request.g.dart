// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_write_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderWriteRequest _$OrderWriteRequestFromJson(Map<String, dynamic> json) =>
    OrderWriteRequest(
      prize: (json['prize'] as num).toDouble(),
      inProgress: json['in_progress'] as bool,
      userId: json['user_id'] as String,
      comment: json['comment'] as String?,
    );

Map<String, dynamic> _$OrderWriteRequestToJson(OrderWriteRequest instance) =>
    <String, dynamic>{
      'prize': instance.prize,
      'in_progress': instance.inProgress,
      'user_id': instance.userId,
      'comment': instance.comment,
    };

import 'package:equatable/equatable.dart';
import 'package:restaurant/schema/_schemas.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_write_request.g.dart';

@JsonSerializable()
class OrderWriteRequest extends Equatable {
  const OrderWriteRequest({
    required this.prize,
    required this.inProgress,
    required this.userId,
    this.comment,
  });

  factory OrderWriteRequest.fromJson(Map<String, dynamic> json) => _$OrderWriteRequestFromJson(json);

  Map<String, dynamic> toJson() => _$OrderWriteRequestToJson(this);


  @JsonKey(name: OrdersFields.prize)
  final double prize;

  @JsonKey(name: OrdersFields.inProgress)
  final bool inProgress;

  @JsonKey(name: OrdersFields.userId)
  final String userId;

  @JsonKey(name: OrdersFields.comment)
  final String? comment;

  @override
  List<Object?> get props => <dynamic>[
        prize,
        inProgress,
        userId,
        comment,
      ];
}

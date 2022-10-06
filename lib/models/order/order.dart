import 'package:equatable/equatable.dart';
import 'package:restaurant/schema/_schemas.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order.g.dart';

@JsonSerializable()
class Order extends Equatable {
  const Order({
    required this.id,
    required this.prize,
    required this.inProgress,
    required this.userId,
  });

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);

  @JsonKey(name: OrdersFields.id)
  final String id;

  @JsonKey(name: OrdersFields.prize)
  final double prize;

  @JsonKey(name: OrdersFields.inProgress)
  final bool inProgress;

  @JsonKey(name: OrdersFields.userId)
  final String userId;

  @override
  List<Object?> get props => <dynamic>[
        id,
        prize,
        inProgress,
        userId,
      ];
}

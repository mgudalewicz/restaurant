import 'package:equatable/equatable.dart';
import 'package:restaurant/schema/_schemas.dart';
import 'package:json_annotation/json_annotation.dart';

part 'suborder.g.dart';

@JsonSerializable()
class Suborder extends Equatable {
  const Suborder({
    required this.id,
    required this.prize,
    required this.itemId,
    required this.orderId,
    required this.amount,
    this.extrasId = const <String>[],
  });

  factory Suborder.fromJson(Map<String, dynamic> json) => _$SuborderFromJson(json);

  Map<String, dynamic> toJson() => _$SuborderToJson(this);

  @JsonKey(name: SubordersFields.id)
  final String id;

  @JsonKey(name: SubordersFields.prize)
  final double prize;

  @JsonKey(name: SubordersFields.itemId)
  final String itemId;

  @JsonKey(name: SubordersFields.orderId)
  final String orderId;

  @JsonKey(name: SubordersFields.amount)
  final int amount;

  @JsonKey(name: SubordersFields.extrasId)
  final List<String> extrasId;

  @override
  List<Object?> get props => <dynamic>[
        id,
        prize,
        itemId,
        orderId,
        extrasId,
        amount,
      ];
}

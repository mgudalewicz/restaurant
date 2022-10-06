import 'package:equatable/equatable.dart';
import 'package:restaurant/schema/_schemas.dart';
import 'package:json_annotation/json_annotation.dart';

part 'suborder_write_request.g.dart';

@JsonSerializable()
class SuborderWriteRequest extends Equatable {
  const SuborderWriteRequest({
    required this.prize,
    required this.itemId,
    required this.orderId,
    required this.amount,
    this.extrasId = const <String>[],
  });

  factory SuborderWriteRequest.fromJson(Map<String, dynamic> json) => _$SuborderWriteRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SuborderWriteRequestToJson(this);

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
        prize,
        itemId,
        orderId,
        extrasId,
        amount,
      ];
}

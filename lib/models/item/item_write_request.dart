import 'package:equatable/equatable.dart';
import 'package:restaurant/schema/_schemas.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:restaurant/widgets/dish.dart';

part 'item_write_request.g.dart';

@JsonSerializable()
class ItemWriteRequest extends Equatable {
  const ItemWriteRequest({
    required this.prize,
    required this.name,
    required this.category,

  });

  factory ItemWriteRequest.fromJson(Map<String, dynamic> json) => _$ItemWriteRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ItemWriteRequestToJson(this);


  @JsonKey(name: ItemsFields.prize)
  final double prize;

  @JsonKey(name: ItemsFields.name)
  final String name;

  @JsonKey(name: ItemsFields.category)
  final Dish category;

  @override
  List<Object?> get props => <dynamic>[
        prize,
        name,
        category,
      ];
}

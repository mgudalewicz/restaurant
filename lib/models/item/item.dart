import 'package:equatable/equatable.dart';
import 'package:restaurant/schema/_schemas.dart';
import 'package:json_annotation/json_annotation.dart';

part 'item.g.dart';

@JsonSerializable()
class Item extends Equatable {
  const Item({
    required this.id,
    required this.prize,
    required this.name,
    required this.category,
  });

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);

  @JsonKey(name: ItemsFields.id)
  final String id;

  @JsonKey(name: ItemsFields.prize)
  final double prize;


  @JsonKey(name: ItemsFields.name)
  final String name;

  @JsonKey(name: ItemsFields.category)
  final String category;

  @override
  List<Object?> get props => <dynamic>[
        id,
        prize,
        name,
        category,
      ];
}

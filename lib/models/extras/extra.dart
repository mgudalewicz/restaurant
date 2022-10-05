import 'package:equatable/equatable.dart';
import 'package:restaurant/schema/_schemas.dart';
import 'package:json_annotation/json_annotation.dart';

part 'extra.g.dart';

@JsonSerializable()
class Extra extends Equatable {
  const Extra({
    required this.id,
    required this.prize,
    required this.name,
    required this.category,
    required this.subcategory,
  });

  factory Extra.fromJson(Map<String, dynamic> json) => _$ExtraFromJson(json);

  Map<String, dynamic> toJson() => _$ExtraToJson(this);

  @JsonKey(name: ExtrasFields.id)
  final String id;

  @JsonKey(name: ExtrasFields.prize)
  final double prize;

  @JsonKey(name: ExtrasFields.name)
  final String name;

  @JsonKey(name: ExtrasFields.category)
  final String category;

  @JsonKey(name: ExtrasFields.subcategory)
  final String subcategory;

  @override
  List<Object?> get props => <dynamic>[
        id,
        prize,
        name,
        category,
        subcategory,
      ];
}

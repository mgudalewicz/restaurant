import 'package:equatable/equatable.dart';
import 'package:restaurant/schema/_schemas.dart';
import 'package:json_annotation/json_annotation.dart';

part 'drink.g.dart';

@JsonSerializable()
class Drink extends Equatable {
  const Drink({
    required this.id,
    required this.prize,
    required this.name,

  });

  factory Drink.fromJson(Map<String, dynamic> json) => _$DrinkFromJson(json);

  Map<String, dynamic> toJson() => _$DrinkToJson(this);

  @JsonKey(name: DrinksFields.id)
  final String id;

  @JsonKey(name: DrinksFields.prize)
  final double prize;


  @JsonKey(name: DrinksFields.name)
  final String name;


  @override
  List<Object?> get props => <dynamic>[
        id,
        prize,
        name,
      ];
}

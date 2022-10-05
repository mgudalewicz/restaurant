import 'package:equatable/equatable.dart';
import 'package:restaurant/schema/_schemas.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pizza.g.dart';

@JsonSerializable()
class Pizza extends Equatable {
  const Pizza({
    required this.id,
    required this.prize,
    required this.name,

  });

  factory Pizza.fromJson(Map<String, dynamic> json) => _$PizzaFromJson(json);

  Map<String, dynamic> toJson() => _$PizzaToJson(this);

  @JsonKey(name: PizzaFields.id)
  final String id;

  @JsonKey(name: PizzaFields.prize)
  final double prize;


  @JsonKey(name: PizzaFields.name)
  final String name;


  @override
  List<Object?> get props => <dynamic>[
        id,
        prize,
        name,
      ];
}

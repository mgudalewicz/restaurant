import 'package:equatable/equatable.dart';
import 'package:restaurant/schema/_schemas.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pizza_write_request.g.dart';

@JsonSerializable()
class PizzaWriteRequest extends Equatable {
  const PizzaWriteRequest({
    required this.prize,
    required this.name,

  });

  factory PizzaWriteRequest.fromJson(Map<String, dynamic> json) => _$PizzaWriteRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PizzaWriteRequestToJson(this);

  @JsonKey(name: PizzaFields.prize)
  final double prize;


  @JsonKey(name: PizzaFields.name)
  final String name;


  @override
  List<Object?> get props => <dynamic>[
        prize,
        name,
      ];
}

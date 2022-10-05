import 'package:equatable/equatable.dart';
import 'package:restaurant/schema/_schemas.dart';
import 'package:json_annotation/json_annotation.dart';

part 'drink_write_request.g.dart';

@JsonSerializable()
class DrinkWriteRequest extends Equatable {
  const DrinkWriteRequest({
    required this.prize,
    required this.name,

  });

  factory DrinkWriteRequest.fromJson(Map<String, dynamic> json) => _$DrinkWriteRequestFromJson(json);

  Map<String, dynamic> toJson() => _$DrinkWriteRequestToJson(this);


  @JsonKey(name: DrinksFields.prize)
  final double prize;


  @JsonKey(name: DrinksFields.name)
  final String name;


  @override
  List<Object?> get props => <dynamic>[
        prize,
        name,
      ];
}

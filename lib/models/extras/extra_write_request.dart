import 'package:equatable/equatable.dart';
import 'package:restaurant/schema/_schemas.dart';
import 'package:json_annotation/json_annotation.dart';

part 'extra_write_request.g.dart';

@JsonSerializable()
class ExtraWriteRequest extends Equatable {
  const ExtraWriteRequest({
    required this.prize,
    required this.name,
    required this.category,
    required this.subcategory,
  });

  factory ExtraWriteRequest.fromJson(Map<String, dynamic> json) => _$ExtraWriteRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ExtraWriteRequestToJson(this);

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
        prize,
        name,
        category,
        subcategory,
      ];
}

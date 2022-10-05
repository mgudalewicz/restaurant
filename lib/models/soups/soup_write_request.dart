import 'package:equatable/equatable.dart';
import 'package:restaurant/schema/_schemas.dart';
import 'package:json_annotation/json_annotation.dart';

part 'soup_write_request.g.dart';

@JsonSerializable()
class SoupWriteRequest extends Equatable {
  const SoupWriteRequest({
    required this.prize,
    required this.name,

  });

  factory SoupWriteRequest.fromJson(Map<String, dynamic> json) => _$SoupWriteRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SoupWriteRequestToJson(this);

  @JsonKey(name: SoupsFields.prize)
  final double prize;


  @JsonKey(name: SoupsFields.name)
  final String name;


  @override
  List<Object?> get props => <dynamic>[
        prize,
        name,
      ];
}

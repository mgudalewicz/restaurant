import 'package:equatable/equatable.dart';
import 'package:restaurant/schema/_schemas.dart';
import 'package:json_annotation/json_annotation.dart';

part 'soup.g.dart';

@JsonSerializable()
class Soup extends Equatable {
  const Soup({
    required this.id,
    required this.prize,
    required this.name,

  });

  factory Soup.fromJson(Map<String, dynamic> json) => _$SoupFromJson(json);

  Map<String, dynamic> toJson() => _$SoupToJson(this);

  @JsonKey(name: SoupsFields.id)
  final String id;

  @JsonKey(name: SoupsFields.prize)
  final double prize;


  @JsonKey(name: SoupsFields.name)
  final String name;


  @override
  List<Object?> get props => <dynamic>[
        id,
        prize,
        name,
      ];
}

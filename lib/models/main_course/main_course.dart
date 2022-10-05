import 'package:equatable/equatable.dart';
import 'package:restaurant/schema/_schemas.dart';
import 'package:json_annotation/json_annotation.dart';

part 'main_course.g.dart';

@JsonSerializable()
class MainCourse extends Equatable {
  const MainCourse({
    required this.id,
    required this.prize,
    required this.name,

  });

  factory MainCourse.fromJson(Map<String, dynamic> json) => _$MainCourseFromJson(json);

  Map<String, dynamic> toJson() => _$MainCourseToJson(this);

  @JsonKey(name: MainCourseFields.id)
  final String id;

  @JsonKey(name: MainCourseFields.prize)
  final double prize;


  @JsonKey(name: MainCourseFields.name)
  final String name;


  @override
  List<Object?> get props => <dynamic>[
        id,
        prize,
        name,
      ];
}

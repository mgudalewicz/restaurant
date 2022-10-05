import 'package:equatable/equatable.dart';
import 'package:restaurant/schema/_schemas.dart';
import 'package:json_annotation/json_annotation.dart';

part 'main_course_write_request.g.dart';

@JsonSerializable()
class MainCourseWriteRequest extends Equatable {
  const MainCourseWriteRequest({
    required this.prize,
    required this.name,

  });

  factory MainCourseWriteRequest.fromJson(Map<String, dynamic> json) => _$MainCourseWriteRequestFromJson(json);

  Map<String, dynamic> toJson() => _$MainCourseWriteRequestToJson(this);

  @JsonKey(name: MainCourseFields.prize)
  final double prize;


  @JsonKey(name: MainCourseFields.name)
  final String name;


  @override
  List<Object?> get props => <dynamic>[
        prize,
        name,
      ];
}

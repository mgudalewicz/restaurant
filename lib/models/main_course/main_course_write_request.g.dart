// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_course_write_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MainCourseWriteRequest _$MainCourseWriteRequestFromJson(
        Map<String, dynamic> json) =>
    MainCourseWriteRequest(
      prize: (json['prize'] as num).toDouble(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$MainCourseWriteRequestToJson(
        MainCourseWriteRequest instance) =>
    <String, dynamic>{
      'prize': instance.prize,
      'name': instance.name,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_course.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MainCourse _$MainCourseFromJson(Map<String, dynamic> json) => MainCourse(
      id: json['id'] as String,
      prize: (json['prize'] as num).toDouble(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$MainCourseToJson(MainCourse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'prize': instance.prize,
      'name': instance.name,
    };

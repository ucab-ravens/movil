import 'package:movil/common/result.dart';
import 'package:movil/modules/courses/domain/course.dart';
import 'package:movil/modules/courses/domain/course_id.dart';

abstract class CourseRepository {
  ResultAsync<Iterable<Course>> findAll();
  ResultAsync<Course> findById(CourseId id);
}

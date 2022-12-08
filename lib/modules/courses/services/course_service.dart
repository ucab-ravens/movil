import 'package:movil/modules/shared/domain/result.dart';
import 'package:movil/modules/courses/domain/course.dart';
import 'package:movil/modules/courses/domain/course_id.dart';
import 'package:movil/modules/courses/domain/course_repository.dart';

class CourseService {
  final CourseRepository _repository;

  CourseService(this._repository);

  ResultAsync<Iterable<Course>> findAll() async {
    return await _repository.findAll();
  }

  ResultAsync<Course> findById(CourseId id) async {
    return await _repository.findById(id);
  }
}

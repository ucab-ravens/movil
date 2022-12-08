// testing storage
import 'package:movil/modules/courses/data/course_repository_impl.dart';
import 'package:movil/modules/courses/data/local/local_course_data_source.dart';
import 'package:movil/modules/courses/data/remote/remote_course_data_source.dart';
import 'package:movil/modules/local_storage/local_storage.dart';

void main() async {
  print('STORAGE TEST');
  LocalStorage storage = LocalStorage();

  await storage.open();

  final repo = CourseRepositoryImpl(
      remote: RemoteCourseDataSource(), local: LocalCourseDataSource(storage));

  final result = await repo.findAll();
  result.fold((error) => print('Error: $error'),
      (courses) => print('Courses: ${courses.length}'));

  await storage.close();
}

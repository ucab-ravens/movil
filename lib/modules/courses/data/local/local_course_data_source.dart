import 'package:movil/common/result.dart';
import 'package:movil/modules/courses/domain/course.dart';
import 'package:movil/modules/courses/domain/course_id.dart';
import 'package:movil/modules/local_storage/local_storage.dart';

class LocalCourseDataSource {
  final LocalStorage storage;

  LocalCourseDataSource(this.storage);

  ResultAsync<Iterable<Course>> findAll() async {
    try {
      // Hacemos un query crudo a la base de datos
      final queryResult = await storage.query('SELECT * FROM courses');
      final mappedCourses = queryResult.map((row) => Course.fromMap(row));

      // Tenemos que verificar que cada curso sea válido
      // ya que el método fromMap() puede retornar Error
      final List<Course> courses = [];
      for (final course in mappedCourses) {
        course.fold((error) => throw error, (course) => courses.add(course));
      }
      return Success(courses);
    } catch (_) {
      return Error(Exception(
          'Error al obtener los cursos desde el almacenamiento local.'));
    }
  }

  ResultAsync<Course> findById(CourseId id) async {
    try {
      final queryResult =
          await storage.query('SELECT * FROM courses WHERE id = ?', [id.value]);
      final mappedCourse = queryResult.map((row) => Course.fromMap(row)).first;

      return mappedCourse.fold(
          (error) => Error(Exception(
              'Error al obtener el curso desde el almacenamiento local.')),
          (course) => Success(course));
    } catch (_) {
      return Error(Exception(
          'Error al obtener el curso desde el almacenamiento local.'));
    }
  }

  ResultAsync<void> save(Course course) async {
    try {
      await storage.insert(
          'INSERT OR REPLACE INTO courses (id, title, description, image) VALUES (?, ?, ?, ?)',
          [
            course.id.value,
            course.title.value,
            course.description.value,
            course.image.value
          ]);
      return const Success(null);
    } catch (_) {
      return Error(
          Exception('Error al guardar el curso en el almacenamiento local.'));
    }
  }

  ResultAsync<void> saveAll(Iterable<Course> courses) async {
    try {
      for (final course in courses) {
        final result = await save(course);
        if (result is Error) {
          return Error(Exception(
              'Error al guardar los cursos en el almacenamiento local.'));
        }
      }
      return const Success(null);
    } catch (_) {
      return Error(
          Exception('Error al guardar los cursos en el almacenamiento local.'));
    }
  }

  ResultAsync<void> dump() async {
    try {
      await storage.delete('DELETE FROM courses');
      return const Success(null);
    } catch (_) {
      return Error(
          Exception('Error al eliminar los cursos del almacenamiento local.'));
    }
  }
}

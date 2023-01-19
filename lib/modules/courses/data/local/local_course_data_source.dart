import 'package:movil/modules/courses/domain/course_lessons.dart';
import 'package:movil/modules/shared/domain/result.dart';
import 'package:movil/modules/courses/domain/course.dart';
import 'package:movil/modules/courses/domain/course_id.dart';
import 'package:movil/modules/local_storage/local_storage.dart';

class LocalCourseDataSource {
  final LocalStorage storage;

  LocalCourseDataSource(this.storage);

  ResultAsync<Iterable<Course>> findAll() async {
    try {
      // Consulta para obtener los cursos con sus respectivas
      // y posteriormente obtener una lista de sus lecciones
      final courseQuery = await storage.query('''
        SELECT * FROM courses
      ''');

      // Mapeamos los cursos
      final mappedCourses = courseQuery.map((row) async {
        // Creamos una lista de lecciones
        final List<Lesson> lessons = [];
        // Obtenemos las lecciones del curso
        final lessonQuery = await storage.query('''
          SELECT * FROM lessons WHERE course_id = ?
        ''', [row['id']]);

        // Mapeamos las lecciones
        //lessonQuery.map((rawLesson) {
        //  // Agregamos la lección a la lista
        //  print('mapping');
        //  lessons.add(Lesson(
        //    title: rawLesson['title'] as String, 
        //    description: rawLesson['description'] as String,
        //    videoUrl: rawLesson['video_url'] as String,
        //  ));
        //});

        for (final rawLesson in lessonQuery) {
          print('mapping!');
          lessons.add(Lesson(
            title: rawLesson['title'] as String, 
            description: rawLesson['description'] as String,
            videoUrl: rawLesson['video_url'] as String,
          ));
        }

        // Retornamos el curso con sus lecciones
        return Course.fromMap({
          'id': row['id'],
          'title': row['title'],
          'subtitle': row['subtitle'],
          'description': row['description'],
          'image': row['image'],
          'lessons': lessons
        });
      });

      final List<Course> courses = [];

      for (final course in mappedCourses) {
        (await course)
            .fold((error) => throw error, (course) => courses.add(course));
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
      // Insertamos el curso en la tabla courses
      await storage.insert(
          'INSERT OR REPLACE INTO courses (id, title, subtitle, description, image) VALUES (?, ?, ?, ?, ?)',
          [
            course.id.value,
            course.title.value,
            course.subtitle.value,
            course.description.value,
            course.image.value
          ]);

      // Insertamos las lecciones en la tabla lessons
      for (final lesson in course.lessons.value) {
        await storage.insert(
            'INSERT OR REPLACE INTO lessons (title, course_id, description, video_url) VALUES (?, ?, ?, ?)',
            [lesson.title, course.id.value, lesson.description, lesson.videoUrl]);
      }

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
      await storage.delete('DELETE FROM lessons');
      return const Success(null);
    } catch (_) {
      return Error(
          Exception('Error al eliminar los cursos del almacenamiento local.'));
    }
  }
}

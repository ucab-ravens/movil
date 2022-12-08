import 'package:http/http.dart' as http;
import 'package:movil/modules/shared/domain/result.dart';
import 'package:movil/modules/courses/domain/course.dart';
import 'dart:convert';

import 'package:movil/modules/courses/domain/course_id.dart';

class RemoteCourseDataSource {
  final String _url = 'https://corsi.onrender.com';
  final String _token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NTIwOCwiZmlyc3RfbmFtZSI6Ikxlb25hcmRvIiwibGFzdF9uYW1lIjoiTGFycmFkIiwiZW1haWwiOiJsZW9uYXJkb2xhcnJhZEBnbWFpbC5jb20iLCJyb2xlIjoiYWRtaW4iLCJpc19hY3RpdmUiOnRydWUsImNyZWF0ZWRfYXQiOiIyMDIyLTEwLTI3VDA5OjU4OjI5Ljk2OVoiLCJ1cGRhdGVkX2F0IjoiMjAyMi0xMC0yN1QwOTo1ODoyOS45NjlaIiwiaWF0IjoxNjY2ODc2OTIyfQ.vM1CEQkmsj192G9NnAf_Z5WMjxVOT8lUrwKvJAWZ1Lc';
  final http.Client _httpClient;

  RemoteCourseDataSource() : _httpClient = http.Client();

  ResultAsync<Iterable<Course>> findAll() async {
    final uri = Uri.parse('$_url/api/courses');
    final headers = {
      'Authorization': 'Bearer $_token',
      'Content-Type': 'application/json'
    };

    try {
      final response = await _httpClient.get(uri, headers: headers);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as List;

        final maps = json.map((item) {
          final List<String> lessons = [];

          for (var lesson in item['lessons']) {
            lessons.add(lesson['title']);
          }

          return {
            'id': item['id'],
            'title': item['title'],
            'subtitle': item['subtitle'],
            'description': item['description'],
            'image': item['image'],
            'lessons': lessons
          };
        });

        final List<Course> courses = [];
        for (var map in maps) {
          // Creamos cada curso y lo agregamos a la lista
          Course.fromMap(map)
              .fold((error) => throw error, (course) => courses.add(course));
        }
        // Retornamos la lista de cursos
        // en caso de que no haya ningun curso se retorna
        // una lista vacia []
        return Success(courses);
      } else {
        return Error(Exception(
            'Error al obtener los cursos desde el servidor. $response'));
      }
    } catch (e) {
      return Error(Exception(
          'Error al obtener los cursos desde la fuente de datos. $e'));
    }
  }

  ResultAsync<Course> findById(CourseId id) async {
    final uri = Uri.parse('$_url/api/courses/${id.value}');
    final headers = {
      'Authorization': 'Bearer $_token',
      'Content-Type': 'application/json'
    };

    try {
      final response = await _httpClient.get(uri, headers: headers);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as Map<String, dynamic>;

        final map = {
          'id': json['id'],
          'title': json['title'],
          'subtitle': json['subtitle'],
          'description': json['description'],
          'image': json['image'],
        };

        return Course.fromMap(map)
            .fold((error) => Error(error), (course) => Success(course));
      } else {
        return Error(Exception(
            'Error al obtener los cursos desde el servidor. $response'));
      }
    } catch (e) {
      return Error(Exception(
          'Error al obtener los cursos desde la fuente de datos. $e'));
    }
  }
}

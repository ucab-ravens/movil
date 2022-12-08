import 'package:flutter/material.dart';
import 'package:movil/modules/courses/domain/course.dart';
import 'package:movil/modules/courses/services/course_service.dart';

class CourseProvider extends ChangeNotifier {
  final CourseService _service;
  Iterable<Course>? _courses;

  CourseProvider(this._service) {
    _load();
  }

  Iterable<Course>? get courses => _courses;

  void _load() {
    _service.findAll().then((result) {
      _courses = result.fold((error) => [], (courses) => courses);
      notifyListeners();
    });
  }
}

import 'package:flutter/material.dart';
import 'package:movil/modules/courses/views/course_card_view.dart';
import 'package:movil/modules/courses/views/course_provider.dart';
import 'package:provider/provider.dart';

class CourseListView extends StatelessWidget {
  const CourseListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final courses =
        context.select((CourseProvider provider) => provider.courses);

    if (courses == null) {
      return const Center(child: CircularProgressIndicator());
    }

    if (courses.isEmpty) {
      return const Center(child: Text('No hay cursos publicados.'));
    }

    return Expanded(
        child: ListView.builder(
      itemCount: courses.length,
      itemBuilder: (context, index) {
        final course = courses.elementAt(index);
        return CourseCard(course);
      },
    ));
  }
}

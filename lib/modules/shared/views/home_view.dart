import 'package:flutter/material.dart';
import 'package:movil/modules/courses/views/course_list_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Corsi'),
        centerTitle: true,
      ),
      body: const CourseListView(),
    );
  }
}

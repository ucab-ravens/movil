import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:movil/modules/courses/domain/course.dart';
import 'package:movil/modules/courses/views/course_card_view.dart';
import 'package:movil/modules/courses/views/course_provider.dart';
import 'package:provider/provider.dart';

class CourseListView extends StatefulWidget {
  const CourseListView({super.key});

  @override
  State<CourseListView> createState() => _CourseListViewState();
}

class _CourseListViewState extends State<CourseListView> {
  @override
  Widget build(BuildContext context) {
    var courses = context.select((CourseProvider provider) => provider.courses);

    Future<void> pullRefresh() async {
      await Future.delayed(const Duration(seconds: 2), () {
        var coursesRefresh =
            Provider.of<CourseProvider>(context, listen: false).courses;
        courses = null;
        //print(courses);
        setState(() {
          courses = coursesRefresh;
          //print(courses);
          //listCourses(courses);
        });
      });
    }

    return Flexible(
        child: RefreshIndicator(
            onRefresh: pullRefresh, child: listCourses(courses)));
  }

  Widget listCourses(courses) {
    return (courses == null)
        ? ListView(
            padding: const EdgeInsets.only(top: 300),
            physics: const AlwaysScrollableScrollPhysics(),
            children: const [
              Center(child: CircularProgressIndicator()),
            ],
          )
        : (courses!.isEmpty)
            ? ListView(
                padding: const EdgeInsets.only(top: 300),
                physics: const AlwaysScrollableScrollPhysics(),
                children: const [
                  Center(
                      child: Image(
                          image: AssetImage('lib/assets/no_courses.png'))),
                ],
              )
            : ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: courses!.length,
                itemBuilder: (context, index) {
                  final course = courses?.elementAt(index);
                  return CourseCard(course!);
                },
              );
  }
}

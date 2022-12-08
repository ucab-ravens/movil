import 'package:flutter/material.dart';
//import 'package:movil/models/course_model.dart';
//import 'package:provider/provider.dart';

//import '../../provider/course_provider.dart';
import '../abstractions/grid_view.dart';
import 'courses_item.dart';

// ignore: must_be_immutable
class CourseGrid extends GridsView {
  CourseGrid(List<dynamic> courses, {Key? key}) : super(courses, key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: items[index],
          );
        },
        childCount: items.length,
      ),
    );
  }

  @override
  void createItems(List itemsList) {
    for (var item in itemsList) {
      items.add(CoursesItem(item));
    }
  }
}

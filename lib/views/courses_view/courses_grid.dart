import 'package:flutter/material.dart';

import '../abstractions/grid_view.dart';
import 'courses_item.dart';

class CourseGrid extends GridsView {
  CourseGrid(List<dynamic> courses, {Key? key}) : super(courses, key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
                child: items[index],
                onTap: () {
                  Navigator.of(context).pushNamed('/courseInfo');
                }),
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

// Router de interfaces de aplicacion
import 'package:flutter/material.dart';

import '../course_info_view/course_info_view.dart';
import '../courses_view/courses_view.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/courses':
        return MaterialPageRoute(builder: (_) => const CoursesView());
      case '/courseInfo':
        return MaterialPageRoute(builder: (_) => const CourseInfoView());
      default:
        return MaterialPageRoute(
            builder: (context) => Center(
                child: Text("404: No route found for path ${settings.name}")));
    }
  }
}

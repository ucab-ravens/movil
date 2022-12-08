import 'package:flutter/cupertino.dart';

import '../abstractions/view.dart';
import 'courses_view_state.dart';

class CoursesView extends View {
  const CoursesView({Key? key}) : super(key: key);

  @override
  CoursesViewState createState() {
    return CoursesViewState();
  }
}

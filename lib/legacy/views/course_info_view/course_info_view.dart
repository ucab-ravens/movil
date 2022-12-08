import 'package:flutter/cupertino.dart';

import '../abstractions/view.dart';
import 'course_info_view_state.dart';

class CourseInfoView extends View {
  const CourseInfoView({Key? key}) : super(key: key);

  @override
  CourseInfoViewState createState() {
    return CourseInfoViewState();
  }
}

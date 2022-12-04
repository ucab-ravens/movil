import 'package:flutter/material.dart';

import '../../controller/adapters/course_controller_adapter.dart';
import '../abstractions/view_state.dart';
import '../common/verify_data.dart';
import '../common/view_header.dart';

class CoursesViewState extends ViewState {
  @override
  Widget build(BuildContext context) {
    controller = CourseControllerAdapter();

    return Scaffold(
        body: FutureBuilder(
            future: controller.get('Publicado'),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return CustomScrollView(slivers: <Widget>[
                viewHeader(),
                const SliverToBoxAdapter(),
                verifyData(
                  snapshot,
                )
              ]);
            }));
  }
}

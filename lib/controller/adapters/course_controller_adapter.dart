import 'dart:convert';

import '../../models/course_model.dart';
import 'controller_adapter.dart';
import '../course_controller.dart';

class CourseControllerAdapter extends ControllerAdapter<String> {
  @override
  Future<List<dynamic>> get(String value) async {
    controller = CourseController();

    Map<String, dynamic> mapData = await controller.get(value);

    return mapData["value"]
        .map((courses) => CourseModel.fromJson(courses))
        .toList();

    /*List<dynamic>.from(json
        .decode(await controller.get(value))["value"]
        .map((courses) => CourseModel.fromJson(courses))
        .toList());*/
  }
}

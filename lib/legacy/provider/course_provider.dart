import '../models/course_model.dart';

class CourseProvider {
  late String idCourse;
  late String title;
  late String subtitle;
  late String description;
  late List<dynamic> lessons;
  late String photo;

  void setCourseProvider(CourseModel model) {
    idCourse = model.idCourse;
    title = model.title;
    subtitle = model.subtitle;
    description = model.description;
    lessons = model.lessons;
    photo = model.photo;
  }
}

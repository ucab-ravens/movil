class CourseModel {
  String idCourse;
  late String title;
  late String subtitle;
  late String description;
  late List<dynamic> lessons;
  late String photo;

  CourseModel(
      {required this.idCourse,
      required this.title,
      required this.subtitle,
      required this.description,
      required this.lessons,
      required this.photo});

  factory CourseModel.fromJson(Map<String, dynamic> json) => CourseModel(
        idCourse: json["id"],
        title: json["title"],
        subtitle: json["subtitle"],
        description: json["description"],
        lessons: List<String>.from(json["lessons"].map((x) => x)),
        photo: json["photo"],
      );
}

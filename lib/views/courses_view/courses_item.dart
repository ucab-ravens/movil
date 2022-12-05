import 'package:flutter/material.dart';

import '../../models/course_model.dart';
import '../abstractions/item_view.dart';

class CoursesItem extends ItemView {
  final CourseModel course;

  const CoursesItem(this.course, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Provider.of<CourseProvider>(context, listen: false).setCourseModel(course);

    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        margin: const EdgeInsets.all(5),
        elevation: 10,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Column(children: <Widget>[
              FadeInImage(
                image: verifyPhoto(course.photo),
                placeholder: const AssetImage('lib/assets/ripple.gif'),
                fit: BoxFit.fill,
              ),
              ListTile(
                title: Text(
                  course.title,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  course.subtitle,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ])));
  }

  ImageProvider verifyPhoto(String? photoRoute) {
    if (photoRoute!.isEmpty) {
      return const NetworkImage(
          'https://globalmetropolitano.com/cms/wp-content/uploads/2017/03/user-icon.png');
    } else {
      return NetworkImage(photoRoute);
    }
  }
}

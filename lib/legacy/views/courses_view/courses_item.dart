import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/course_model.dart';
import '../../provider/course_provider.dart';
import '../abstractions/item_view.dart';
import '../common/verify_photo.dart';

class CoursesItem extends ItemView {
  final CourseModel course;

  const CoursesItem(this.course, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
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
                ]))),
        onTap: () {
          Provider.of<CourseProvider>(context, listen: false)
              .setCourseProvider(course);
          Navigator.of(context).pushNamed('/courseInfo');
        });
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/course_provider.dart';
import '../abstractions/view_state.dart';
import '../common/verify_photo.dart';
import '../common/view_header.dart';

class CourseInfoViewState extends ViewState {
  @override
  Widget build(BuildContext context) {
    CourseProvider course = Provider.of<CourseProvider>(context, listen: false);

    return Scaffold(
        body: CustomScrollView(slivers: <Widget>[
      viewHeader(),
      SliverToBoxAdapter(
        child: Column(
          children: [
            FadeInImage(
              image: verifyPhoto(course.photo),
              placeholder: const AssetImage('lib/assets/ripple.gif'),
              fit: BoxFit.fill,
            ),
            Text(
              course.title,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              course.subtitle,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  child: Text(
                    course.description,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.normal),
                  ),
                ),
                Flexible(
                  child: Column(
                    children: [
                      for (var lesson in course.lessons)
                        Text(
                          lesson,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontWeight: FontWeight.normal),
                        )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ]));
  }
}

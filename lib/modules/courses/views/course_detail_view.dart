import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movil/modules/courses/domain/course.dart';
import 'package:movil/modules/shared/views/header_view.dart';

class CourseDetailView extends StatelessWidget {
  final Course course;

  const CourseDetailView(this.course, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: <Widget>[
      const HeaderView(),
      SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl:
                  'https://concepto.de/wp-content/uploads/2014/08/programacion-2-e1551291144973.jpg',
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
              child: Text(
                course.title.value,
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Text(
                course.title.value,
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                course.description.value,
                textAlign: TextAlign.left,
                overflow: TextOverflow.visible,
              ),
            ),
          ],
        ),
      ),
    ]));
  }
}

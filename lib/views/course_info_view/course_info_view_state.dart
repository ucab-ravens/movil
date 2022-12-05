import 'package:flutter/material.dart';

import '../abstractions/view_state.dart';
import '../common/verify_photo.dart';
import '../common/view_header.dart';

class CourseInfoViewState extends ViewState {
  @override
  Widget build(BuildContext context) {
    //CourseProvider course = Provider.of<CourseProvider>(context, listen: false);

    return Scaffold(
        body: CustomScrollView(slivers: <Widget>[
      viewHeader(),
      SliverToBoxAdapter(
        child: Column(
          children: [
            FadeInImage(
              image: const AssetImage('lib/assets/ripple.gif'),
              /*verifyPhoto(/*course.photo*/)*/
              placeholder: const AssetImage('lib/assets/ripple.gif'),
              fit: BoxFit.fill,
            ),
            Text(
              'Algo',
              //course.title,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              'Algo',
              //course.subtitle,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  child: Text(
                    'Algo',
                    //course.description,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.normal),
                  ),
                ),
                Flexible(
                  child: Text('Algo')
                  /*Column(
                    children: [
                      for (var lesson in course.lessons)
                        Text(
                          lesson,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontWeight: FontWeight.normal),
                        )
                    ],
                  )*/
                  ,
                ),
              ],
            ),
          ],
        ),
      ),
    ]));
  }
}

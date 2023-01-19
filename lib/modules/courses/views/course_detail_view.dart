import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movil/modules/courses/domain/course.dart';
import 'package:movil/modules/shared/views/header_view.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CourseDetailView extends StatelessWidget {
  final Course course;

  const CourseDetailView(this.course, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(course.title.value),
        ),
        body: CustomScrollView(slivers: <Widget>[
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CachedNetworkImage(
                  imageUrl: course.image.value,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
                  child: Text(
                    course.title.value,
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.visible,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Text(
                    course.subtitle.value,
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.visible,
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
                // list every lesson in course.lesson.value
                // for (var lesson in course.lessons.value) {
                //   Text(lesson.title.value);
                // }
                Column(
                  children: course.lessons.value
                      .map((lesson) => Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Card(
                              child: ListTile(
                                  title: Text(lesson.title),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => YoutubePlayer(
                                                  controller:
                                                      YoutubePlayerController(
                                                    initialVideoId: YoutubePlayer
                                                        .convertUrlToId(
                                                            lesson.videoUrl)!,
                                                    flags:
                                                        const YoutubePlayerFlags(
                                                      autoPlay: true,
                                                      mute: false,
                                                    ),
                                                  ),
                                                  showVideoProgressIndicator:
                                                      true,
                                                  progressIndicatorColor:
                                                      Colors.amber,
                                                  progressColors:
                                                      const ProgressBarColors(
                                                          playedColor:
                                                              Colors.amber,
                                                          handleColor: Colors
                                                              .amberAccent),
                                                  onReady: () {
                                                    print('Player is ready.');
                                                  },
                                                )));
                                  }),
                            ),
                          ))
                      .toList(),
                )
              ],
            ),
          ),
        ]));
  }
}

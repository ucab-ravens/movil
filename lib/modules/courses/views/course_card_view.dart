import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movil/modules/courses/domain/course.dart';
import 'package:movil/modules/courses/views/course_detail_view.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CourseCard extends StatelessWidget {
  final Course course;

  const CourseCard(this.course, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            margin: const EdgeInsets.all(10) +
                const EdgeInsets.only(left: 5) +
                const EdgeInsets.only(right: 5),
            elevation: 3,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Column(children: <Widget>[
                  CachedNetworkImage(
                    imageUrl:
                        'https://concepto.de/wp-content/uploads/2014/08/programacion-2-e1551291144973.jpg',
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                  ListTile(
                    title: Text(
                      course.title.value,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      course.title.value,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ]))),
        onTap: () {
          /*
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CourseDetailView(course)));
        }*/
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => YoutubePlayer(
                        controller: YoutubePlayerController(
                          initialVideoId: YoutubePlayer.convertUrlToId(
                              'https://www.youtube.com/watch?v=QH2-TGUlwu4')!,
                          flags: const YoutubePlayerFlags(
                            autoPlay: true,
                            mute: false,
                          ),
                        ),
                        showVideoProgressIndicator: true,
                        progressIndicatorColor: Colors.amber,
                        progressColors: const ProgressBarColors(
                            playedColor: Colors.amber,
                            handleColor: Colors.amberAccent),
                        onReady: () {
                          print('Player is ready.');
                        },
                      )));
        });
  }
}

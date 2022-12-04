import 'package:flutter/material.dart';

import '../../models/course_model.dart';
import '../abstractions/item_view.dart';

class CoursesItem extends ItemView {
  final CourseModel course;

  const CoursesItem(this.course, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Construir Doctor Item Widget a nivel grafico

    //Provider.of<CourseProvider>(context, listen: false).setCourseModel(course);

    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        margin: const EdgeInsets.all(5),
        elevation: 10,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Column(children: <Widget>[
              const FadeInImage(
                // En esta propiedad colocamos la imagen a descargar
                image: AssetImage('lib/assets/1.jpg'),

                // En esta propiedad colocamos el gif o imagen de carga
                // debe estar almacenado localmente
                placeholder: AssetImage('lib/assets/1.jpg'),

                // En esta propiedad colocamos mediante el objeto BoxFit
                // la forma de acoplar la imagen en su contenedor
                fit: BoxFit.cover,

                // En esta propiedad colocamos el alto de nuestra imagen
                height: 160,
              ),
              ListTile(
                title: Text(course.title),
                subtitle: Text(course.subtitle),
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

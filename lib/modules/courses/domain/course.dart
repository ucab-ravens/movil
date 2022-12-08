import 'package:movil/common/result.dart';
import 'package:movil/modules/courses/domain/course_description.dart';
import 'package:movil/modules/courses/domain/course_id.dart';
import 'package:movil/modules/courses/domain/course_image.dart';
import 'package:movil/modules/courses/domain/course_title.dart';

class Course {

  CourseId id;
  CourseTitle title;
  CourseDescription description;
  CourseImage image;

  /// Construtor privado del agregado [Course]
  /// Lo llamaremos dentro de nuestros métodos de fábrica
  Course._constructor({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
  });
  
  /// Método de fábrica para crear un [Course]
  /// 
  /// Usamos un try-catch por dos razones
  /// 1. Podemos lanzar excepciones de tipo [Exception] generadas
  ///    en los [ValueObject] y manejarlas en el catch
  /// 2. Al tratar de parsear un mapa a un [ValueObject] podemos
  ///    recibir un [FormatException] si el valor no es del tipo
  ///    esperado 
  /// 
  /// Envolvemos el resultado en un [Result], así no tendremos
  /// que usar try-catch en el resto de la aplicación
  static Result<Course> fromMap(Map<String, dynamic> map) {    
    try {      
      // Validamos cada uno de los ValueObject
      final id = CourseId.create(map['id']).fold(
        (exception) => throw exception,
        (value) => value,
      );
      final title = CourseTitle.create(map['title']).fold(
        (exception) => throw exception,
        (value) => value,
      );
      final description = CourseDescription.create(map['description']).fold(
        (exception) => throw exception,
        (value) => value,
      );
      final image = CourseImage.create(map['image']).fold(
        (exception) => throw exception,
        (value) => value,
      );

      return Success(
        Course._constructor(
          id: id,
          title: title,
          description: description,
          image: image,
        ),
      );
    }
    catch (e) {
      return Error(Exception('''[corsi]: Error al crear el curso. 
        No se ha podido parsear los datos. $e'''));
    }
  }

  /// Método de fábrica para crear un [Map<String, dynamic>]
  /// a partir de un [Course]
  static Result<Map<String, dynamic>> toMap(Course course) {
    try {
      return Success({
        'id': course.id.value,
        'title': course.title.value,
        'description': course.description.value,
        'image': course.image.value,
      });
    }
    catch (e) {
      return Error(Exception('''[corsi]: Error al convertir el curso a un mapa. 
        No se ha podido parsear los datos. $e'''));
    }
  }

  @override
  String toString() {
    return 'Course(\n\tid: ${id.toString()}, \n\ttitle: ${title.toString()}, \n\tdescription: ${description.toString()}, \n\timage: ${image.toString()}\n)';
  }

}
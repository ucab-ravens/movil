import 'package:movil/modules/shared/domain/value_object.dart';
import 'package:movil/modules/shared/domain/result.dart';

class Lesson {
  final String title;
  final String description;
  final String videoUrl;

  Lesson({
    required this.title,
    required this.description,
    required this.videoUrl,
  });
}

class CourseLessons extends ValueObject<List<Lesson>> {
  /// Constructor privado que llama
  /// al constructor de la clase padre [ValueObject]
  CourseLessons._constructor(List<Lesson> value) : super(value);

  /// [FactoryMethod]
  /// Por el momento no tenemos restricciones
  /// asi que siempre retornamos [Success]
  static Result<CourseLessons> create(List<Lesson> lessons) =>
      Success(CourseLessons._constructor(lessons));
}

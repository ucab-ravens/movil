import 'package:movil/modules/shared/domain/value_object.dart';
import 'package:movil/modules/shared/domain/result.dart';

class CourseLessons extends ValueObject<List<String>> {
  /// Constructor privado que llama
  /// al constructor de la clase padre [ValueObject]
  CourseLessons._constructor(List<String> value) : super(value);

  /// [FactoryMethod]
  /// Por el momento no tenemos restricciones
  /// asi que siempre retornamos [Success]
  static Result<CourseLessons> create(List<String> lessons) =>
      Success(CourseLessons._constructor(lessons));
}

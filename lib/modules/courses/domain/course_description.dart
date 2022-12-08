import 'package:movil/modules/shared/domain/value_object.dart';
import 'package:movil/modules/shared/domain/result.dart';

class CourseDescription extends ValueObject<String> {
  /// Constructor privado que llama
  /// al constructor de la clase padre [ValueObject]
  CourseDescription._constructor(String value) : super(value);

  /// [FactoryMethod]
  /// Por el momento no tenemos restricciones
  /// asi que siempre retornamos [Success]
  static Result<CourseDescription> create(String description) =>
      Success(CourseDescription._constructor(description));
}

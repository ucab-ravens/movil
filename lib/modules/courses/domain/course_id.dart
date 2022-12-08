import 'package:movil/modules/shared/domain/result.dart';
import 'package:movil/modules/shared/domain/value_object.dart';

class CourseId extends ValueObject<int> {
  /// Constructor privado que llama
  /// al constructor de la clase padre [ValueObject]
  CourseId._constructor(int value) : super(value);

  /// [FactoryMethod]
  /// Por el momento no tenemos restricciones
  /// asi que siempre retornamos [Success]
  static Result<CourseId> create(int id) => Success(CourseId._constructor(id));
}

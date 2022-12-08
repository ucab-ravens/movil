import 'package:movil/common/value_object.dart';
import 'package:movil/common/result.dart';

class CourseTitle extends ValueObject<String> {
  
  /// Constructor privado que llama
  /// al constructor de la clase padre [ValueObject]
  CourseTitle._constructor(String value) 
    : super(value);
  
  /// [FactoryMethod]
  /// Por el momento no tenemos restricciones 
  /// asi que siempre retornamos [Success]
  static Result<CourseTitle> create(String title) => 
    Success(CourseTitle._constructor(title));  
    
}
import 'package:movil/common/value_object.dart';
import 'package:movil/common/result.dart';

class CourseImage extends ValueObject<String> {
  
  /// Constructor privado que llama
  /// al constructor de la clase padre [ValueObject]
  CourseImage._constructor(String value) 
    : super(value);
  
  /// [FactoryMethod]
  /// Por el momento no tenemos restricciones 
  /// asi que siempre retornamos [Success]
  static Result<CourseImage> create(String image) => 
    Success(CourseImage._constructor(image));  
    
}
import 'package:movil/common/result.dart';
import 'package:movil/modules/courses/data/local/local_course_data_source.dart';
import 'package:movil/modules/courses/data/remote/remote_course_data_source.dart';
import 'package:movil/modules/courses/domain/course.dart';
import 'package:movil/modules/courses/domain/course_id.dart';
import 'package:movil/modules/courses/domain/course_repository.dart';

class CourseRepositoryImpl implements CourseRepository {

  final RemoteCourseDataSource remote; 
  final LocalCourseDataSource local;

  CourseRepositoryImpl({
    required this.remote,
    required this.local,
  });

  @override
  ResultAsync<Iterable<Course>> findAll() async {
    // Primero intentamos obtener los cursos desde el almacenamiento remoto
    final remoteResult = await remote.findAll();

    // Si la petición fue exitosa, guardamos los cursos en el almacenamiento local
    // y retornamos los cursos
    if (remoteResult is Success) {
      await local.dump();
      await local.saveAll(remoteResult.getOrElse((error) => []));
      return remoteResult;
    }

    // Si la petición falló, intentamos obtener los cursos desde el almacenamiento local
    final localResult = await local.findAll();
    return localResult;
  }

  @override
  ResultAsync<Course> findById(CourseId id) async {    
    // Primero intentamos obtener el curso desde el almacenamiento remoto
    final remoteResult = await remote.findById(id);
    var result = remoteResult;

    // Si la petición fue exitosa, guardamos el curso en el almacenamiento local
    // y retornamos el curso    
    remoteResult.fold(
      (error) async {
        // Si la petición falló, intentamos obtener el curso desde el almacenamiento local
        result = await local.findById(id);
      },
      (course) async => await local.save(course)
    );

    return result;    
  }
}

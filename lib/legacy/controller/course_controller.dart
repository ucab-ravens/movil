//import 'package:http/http.dart' as http;
import '../../fakeAPI/data.dart';
import 'controller.dart';

class CourseController implements Controller<String> {
  @override
  Future<dynamic> get(String state) async {
    if (state == 'Publicado') {
      final response = await Future.delayed(
        const Duration(seconds: 2),
        () => data,
      );

      //http.get(Uri.parse('http://10.0.1.12:3005/search/spe/$state'));

      return response; //.body;
    }
  }
}

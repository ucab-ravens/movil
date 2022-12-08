import 'dart:io';
import 'package:flutter/material.dart';
import 'package:movil/modules/courses/data/course_repository_impl.dart';
import 'package:movil/modules/courses/data/local/local_course_data_source.dart';
import 'package:movil/modules/courses/data/remote/remote_course_data_source.dart';
import 'package:movil/modules/courses/domain/course_repository.dart';
import 'package:movil/modules/courses/services/course_service.dart';
import 'package:movil/modules/local_storage/local_storage.dart';
import 'package:movil/modules/shared/views/home_view.dart';
import 'package:provider/provider.dart';
import 'modules/courses/views/course_provider.dart';

// Necesario para emulador samsung externo (Alines)
class CustomHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

final storage = LocalStorage();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Necesario para emulador samsung externo (Alines)
  HttpOverrides.global = CustomHttpOverrides();
  await storage.open();
  runApp(const CorsiApp());
}

class CorsiApp extends StatefulWidget {
  const CorsiApp({Key? key}) : super(key: key);

  @override
  State<CorsiApp> createState() => CorsiAppState();
}

class CorsiAppState extends State<CorsiApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<LocalStorage>(create: (_) => storage),
        Provider<CourseRepository>(
          create: (context) => CourseRepositoryImpl(
            remote: RemoteCourseDataSource(),
            local: LocalCourseDataSource(storage),
          ),
        ),
        ChangeNotifierProvider<CourseProvider>(
          create: (context) => CourseProvider(
            CourseService(context.read<CourseRepository>()),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Corsi',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (_) => const HomeView(),
        },
      ),
    );
  }
}

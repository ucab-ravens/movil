import 'dart:io';
import 'package:flutter/material.dart';
import 'package:movil/views/courses_view/courses_view.dart';
import 'package:provider/provider.dart';
import 'provider/course_provider.dart';
import 'views/config/app_router.dart';

// Necesario para emulador samsung externo (Alines)
class CustomHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  // Necesario para emulador samsung externo (Alines)
  HttpOverrides.global = CustomHttpOverrides();
  runApp(const CorsiApp());
}

class CorsiApp extends StatefulWidget {
  const CorsiApp({Key? key}) : super(key: key);

  @override
  State<CorsiApp> createState() => _CorsiAppState();
}

class _CorsiAppState extends State<CorsiApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider(create: (context) => CourseProvider()),
        ],
        builder: (context, child) {
          return MaterialApp(
              title: 'Corsi',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              // Generador de rutas para navegacion
              onGenerateRoute: AppRouter.onGenerateRoute,
              // Screen Inicial
              initialRoute: 'home',
              routes: {
                'home': (_) => const CoursesView(),
              });
        });
  }
}

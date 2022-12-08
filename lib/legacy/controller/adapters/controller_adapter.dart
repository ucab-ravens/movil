import '../../models/model.dart';
import '../controller.dart';

abstract class ControllerAdapter<T> implements Controller<T> {
  late Controller<T> controller;
  late Model model;

  @override
  Future<dynamic> get(T value);
}

import 'package:flutter/cupertino.dart';

import '../../controller/controller.dart';
import 'view.dart';

abstract class ViewState extends State<View> {
  late Controller controller;

  setContex(value) {
    return controller.get(value);
  }

  @override
  Widget build(BuildContext context);
}

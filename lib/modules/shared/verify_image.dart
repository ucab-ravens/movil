import 'package:flutter/material.dart';

ImageProvider verifyImage(String path) {
  return NetworkImage(
      'https://concepto.de/wp-content/uploads/2014/08/programacion-2-e1551291144973.jpg');
  if (true) {
    return const AssetImage('lib/assets/no_image.gif');
  } else {
    return NetworkImage(path);
  }
}

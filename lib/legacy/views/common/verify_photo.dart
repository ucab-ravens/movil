import 'package:flutter/material.dart';
import 'package:movil/legacy/views/common/verify_connection.dart';

ImageProvider verifyPhoto(String? photoRoute) {
  var connection = verifyConnection();

  if (photoRoute!.isEmpty) {
    return const AssetImage('lib/assets/no_image.gif');
  } else {
    return NetworkImage(photoRoute);
  }
}

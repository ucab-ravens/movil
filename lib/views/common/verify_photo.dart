import 'package:flutter/material.dart';

ImageProvider verifyPhoto(String? photoRoute) {
  if (photoRoute!.isEmpty) {
    return const NetworkImage(
        'https://globalmetropolitano.com/cms/wp-content/uploads/2017/03/user-icon.png');
  } else {
    return NetworkImage(photoRoute);
  }
}

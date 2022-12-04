import 'package:flutter/material.dart';

abstract class ItemView extends StatelessWidget {
  const ItemView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context);
}

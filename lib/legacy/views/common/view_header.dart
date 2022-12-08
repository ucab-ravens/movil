import 'package:flutter/material.dart';

Widget viewHeader() {
  return SliverAppBar(
    floating: false,
    pinned: true,
    snap: false,
    centerTitle: false,
    automaticallyImplyLeading: false,
    title: Center(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        SizedBox(width: 5),
        Text('Corsi'),
      ],
    )),
  );
}

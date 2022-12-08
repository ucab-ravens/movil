import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeaderView extends StatelessWidget {
  const HeaderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}

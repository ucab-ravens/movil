import 'package:flutter/material.dart';

import 'item_view.dart';

abstract class GridsView extends StatelessWidget {
  @protected
  late List<ItemView> items;

  GridsView(List<dynamic> contex, {Key? key}) : super(key: key) {
    items = [];
    createItems(contex);
  }

  void createItems(List<dynamic> itemsList);

  @override
  Widget build(BuildContext context);
}

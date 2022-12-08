import 'package:flutter/cupertino.dart';

import 'view_state.dart';

abstract class View extends StatefulWidget {
  const View({Key? key}) : super(key: key);

  @override
  ViewState createState();
}

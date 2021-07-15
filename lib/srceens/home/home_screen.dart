import 'package:flutter/material.dart';
import 'package:nature/srceens/home/components/body.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: buildAppBar(), body: Body());
  }
}

AppBar buildAppBar() {
  return AppBar(
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.window_outlined),
        onPressed: null,
      ));
}

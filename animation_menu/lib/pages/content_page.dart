import 'package:demo/widget/guillotine_menu.dart';
import 'package:demo/widget/page.dart';
import 'package:flutter/material.dart';

class ContentPage extends StatefulWidget {
  @override
  _ContentPageState createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: new Container(
        child: new Stack(
          alignment: Alignment.topLeft,
          children: <Widget>[
            new Page(),
            new GuillotineMenu(),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_barcode/main.dart';


class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => new _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: PrimaryColor,
        title: new Text('Acerca'),

      ),
    );
  }
}
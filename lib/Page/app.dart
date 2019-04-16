
import 'package:flutter/material.dart';
import 'package:flutter_barcode/Page/Home/HomeScan.dart';


class App extends StatelessWidget {



  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      body: Stack(
        children: <Widget>[
          HomePagescan(),
        ]
      )
    );
  }
}
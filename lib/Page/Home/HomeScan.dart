import 'dart:async';

import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode/Page/Capture/CaptureCode.dart';


class HomePagescan extends StatefulWidget {
  @override
  HomePagescanState createState() {
    return new HomePagescanState();
  }
}

class HomePagescanState extends State<HomePagescan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scanner"),
        actions: <Widget>[
          IconButton(
            iconSize: 40,
            icon: Icon(Icons.add_circle),
            tooltip: 'Lista de Gasolineras',
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Capture()),
              );
            },
          ),
        ],
      ),
      body: Center(

      )
    );
  }
}

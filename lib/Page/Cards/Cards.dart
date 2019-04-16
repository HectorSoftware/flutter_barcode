import 'dart:async';

import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';


class CardAdd extends StatefulWidget {
  @override
  CardAddState createState() {
    return new CardAddState();
  }
}

class CardAddState extends State<CardAdd> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'HOLA DESDE CARDSSSSSSS'
        ),
      ),
    );
  }
}

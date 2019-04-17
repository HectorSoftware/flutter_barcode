import 'dart:async';
import 'package:flutter_barcode/Page/Sqlite/BarCodeClass.dart';
import 'package:flutter_barcode/Page/Sqlite/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode/Page/Sqlite/BarCodeClass.dart';
import 'package:flutter_barcode/Page/Sqlite/database_helper.dart';

class CardAdd extends StatefulWidget {
  @override
  _CardAddState createState() => _CardAddState();
}


class _CardAddState extends State<CardAdd> {
  @override
  void didUpdateWidget(CardAdd oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() {

    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    obtener();
  }

  obtener() async{
    List<BarCode> lista = await ClientDatabaseProvider.db.getAllCodes();
    print(lista.length);
    print('**********');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}

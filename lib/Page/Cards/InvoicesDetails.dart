import 'dart:async';

import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode/Page/Capture/CaptureCode.dart';
import 'package:flutter_barcode/Page/Cards/Cards.dart';
import 'package:flutter_barcode/Page/Sqlite/InvoicesClass.dart';
import 'package:flutter_barcode/api/Services.dart';



class InvoiceDetails extends StatefulWidget {

  InvoiceDetails({this.codigo, this.Description});

  final  codigo;
  final Description;

  @override
  _InvoiceDetailsState createState() => new _InvoiceDetailsState();
}

class _InvoiceDetailsState extends State<InvoiceDetails> {

    Services Servicios = Services();
    List<InvoicesCode> listInvoice = List<InvoicesCode>();


  @override
  void initState() {
    initvalues();
    super.initState();
  }

  void initvalues() async {
    Servicios.ConnectionTest('192.168.1.14',3000);
    Servicios.GetInvoiceAndSave(widget.codigo);
    print(listInvoice.length);
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(

    );
  }
}

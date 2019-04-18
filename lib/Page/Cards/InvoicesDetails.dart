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

  void initvalues() async {
    listInvoice = await Servicios.GetInvoiceAndSave(widget.codigo);
    print(listInvoice.length);
  }
  @override
  void initState() {
    initvalues();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(

    );
  }
}

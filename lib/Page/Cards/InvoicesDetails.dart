import 'dart:async';

import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode/Page/Capture/CaptureCode.dart';
import 'package:flutter_barcode/Page/Cards/Cards.dart';
import 'package:flutter_barcode/Page/Sqlite/InvoicesClass.dart';
import 'package:flutter_barcode/api/Services.dart';
import 'package:flutter_barcode/main.dart';



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

    print(widget.codigo);
    Servicios.ConnectionTest('192.168.1.14',3000);
    listInvoice = await Servicios.GetInvoiceAndSave(widget.codigo);
    print(listInvoice.length);
    imprimir();
  }

    imprimir(){
      setState(() {
        listInvoice;
      });

  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: AppBar(
        title: Text('Detalles'),
      ),
      body: ListView.builder(
        itemCount: listInvoice.length,
        itemBuilder:(BuildContext context, int index){
          return Column(
            children: <Widget>[
          ListTile(

          title: Text('Estado:  ' + listInvoice[index].status+ '\nMes: ' +  listInvoice[index].Month + '\nAño: ' + listInvoice[index].Year),
          subtitle: Text('Desde:   ' + listInvoice[index].dateFrom[0] + ' Hasta: ' + listInvoice[index].ExpirationDate[0] + ' Total : ' + listInvoice[index].total.toString()),
          leading: CircleAvatar(child: Icon(Icons.details)),
          ),
            Divider(
              height: 25,
            )
          ],
          );
        } ,
      ),
    );
  }
}

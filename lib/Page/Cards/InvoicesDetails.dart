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
    bool Estatus = false;
    int contador = 0;

  @override
  void initState() {
    initvalues();
    super.initState();
  }

  void initvalues() async {
    Servicios.ConnectionTest('3.17.109.60',3000);
    Estatus = false;
    while (!Estatus) {
      listInvoice = await Servicios.GetInvoiceAndSave(widget.codigo);
      imprimir();
      if(contador == 200){
        Estatus = true;
      }else{
        print('Aumentando $contador');
        contador++;
      }
    }
  }

  imprimir(){
      setState(() {
        listInvoice;
        print(listInvoice.length);
        if(listInvoice.length > 0){
          Estatus = true;
        }
      });
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: AppBar(
        title: Text('Detalles'),
      ),
      body: Container(
        child: Estatus ?  ListView.builder(
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
        ) :
        Center(
          child: CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(PrimaryColor)),
        ),
      )
    );
  }
}

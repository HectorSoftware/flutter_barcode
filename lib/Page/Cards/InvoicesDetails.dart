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

    /*return new Scaffold(
      appBar: AppBar(
        title: Text('Detalles'),
      ),
      body: ListView.builder(
        itemCount: listInvoice.length,
        itemBuilder:(BuildContext context, int index){
          return ListTile(
            title: Text(listInvoice[index].Month),
            subtitle: Text(listInvoice[index].total.toString()),
          );
        } ,
      ),
    );*/

    return new Scaffold(
      appBar: AppBar(
        title: Text('Detalles'),
      ),
      body: ListView.builder(
        itemCount: 12,
        itemBuilder:(BuildContext context, int index){
          return Column(
            children: <Widget>[
          ListTile(
          title: Text('Estado:  ' + '1\n' + 'Mes: ' + '  2\n' + 'Año: ' + 'Añoo'),
          subtitle: Text('Desde:  ' + 'fecha  ' + 'Hasta:' + '  fecha2  ' + 'Total : ' + 'precio'),
          leading: CircleAvatar(child: Icon(Icons.list)),


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



/* child: Column(
              children: <Widget>[
                Container(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                              Container(
                                 child: Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: <Widget>[
                                     IconButton(onPressed: () {},icon: Icon(Icons.arrow_forward),),
                                     Text('Estado:',style: TextStyle(color: Colors.white,fontSize: 20,),),
                                     Text('Total:',style: TextStyle(color:Colors.white,fontSize: 20 ),),
                                     Text('Desde:',style: TextStyle(color:Colors.white,fontSize: 20 ),),
                                     Text('Hasta:',style: TextStyle(color:Colors.white,fontSize: 20 ),),
                                     Text('Mes:',style: TextStyle(color:Colors.white,fontSize: 20 ),),
                                     Text('Año:',style: TextStyle(color:Colors.white,fontSize: 20 ),),
                                     Text('Total:',style: TextStyle(color:Colors.white,fontSize: 20 ),),
                                     Divider(
                                       height: 10,
                                     )
                                   ],
                                 ),
                                decoration: BoxDecoration(
                                  color: PrimaryColor,

                               ),
                              ),

                          ],
                        ),

                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                          /*  Text(listInvoice[index].status),
                            Text(listInvoice[index].total.toString()),
                            Text(listInvoice[index].dateFrom.toString()),
                            Text(listInvoice[index].Month),
                            Text(listInvoice[index].ExpirationDate.toString()),
                            Text(listInvoice[index].Year),
                            Text(listInvoice[index].total.toString()),*/
                          ],
                        ),

                      ),

                    ],
                  ),
                ),


              ],
            ),*/
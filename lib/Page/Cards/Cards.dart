import 'dart:async';
import 'package:flutter_barcode/Page/Cards/InvoicesDetails.dart';
import 'package:flutter_barcode/Page/Sqlite/BarCodeClass.dart';
import 'package:flutter_barcode/Page/Sqlite/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode/Page/Sqlite/BarCodeClass.dart';
import 'package:flutter_barcode/Page/Sqlite/database_helper.dart';
import 'package:flutter_barcode/main.dart';
import 'package:flutter_barcode/api/Services.dart';

class CardAdd extends StatefulWidget {
  @override
  _CardAddState createState() => _CardAddState();
}


class _CardAddState extends State<CardAdd> {

  Services Servicios = new Services();
  String Codigo = '';

  @override
  void didUpdateWidget(CardAdd oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() {

    });
  }

  @override
  void initState() {
    PeticionGrpc();
    super.initState();
  }

  void PeticionGrpc() async{
    //Servicios.ConnectionTest('192.168.1.14',3000);
    //obtener();
    //Servicios.GetInvoiceAndSave('');
    //Servicios.CloseTest();
  }
  obtener() async{
    List<BarCode> lista = await ClientDatabaseProvider.db.getAllCodes();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:FutureBuilder<List<BarCode>>(
        //we call the method, which is in the folder db file database.dart
        future: ClientDatabaseProvider.db.getAllCodes(),
        builder: (BuildContext context, AsyncSnapshot<List<BarCode>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index){
                BarCode item = snapshot.data[index];
                return Dismissible(
                  key: UniqueKey(),
                  background: Container(color: PrimaryColor),
                  onDismissed: (diretion) {
                    ClientDatabaseProvider.db.deleteCodeWithId(item.barcode);
                  },
                  child: ListTile(
                    title: Text(item.Descripcion),
                    subtitle: Text(item.barcode),
                    leading: CircleAvatar(child: Icon(Icons.check_circle)),

                    onTap: () {
                      if(item.barcode.length == 12)
                        {
                          Codigo = item.barcode;// HACER VENTANA EMERGENTE
                        }
                      if(item.barcode.length ==  30 ){
                        Codigo = item.barcode.substring(2,14);
                        print(Codigo);
                        print('--------CARDS');

                      }else{
                        print("ERROR");
                      }
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => InvoiceDetails(codigo: Codigo,Description: item.Descripcion),
                        //builder: (BuildContext context) => InvoiceDetails(codigo: '001020400192',Description: item.Descripcion),
                      ),
                      );
                    },
                  ),
                );
              },
            );
          }else {
            return Center(
             child: Icon(Icons.arrow_forward));
          }
        },
      ),
    );
  }
}

import 'dart:async';
import 'package:flutter_barcode/Page/Sqlite/BarCodeClass.dart';
import 'package:flutter_barcode/Page/Sqlite/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      body:FutureBuilder<List<BarCode>>(
        //we call the method, which is in the folder db file database.dart
        future: ClientDatabaseProvider.db.getAllCodes(),
        builder: (BuildContext context, AsyncSnapshot<List<BarCode>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              physics: BouncingScrollPhysics(),
              //Count all records
              itemCount: snapshot.data.length,
              //all the records that are in the client table are passed to an item Client item = snapshot.data [index];
              itemBuilder: (BuildContext context, int index){
                BarCode item = snapshot.data[index];
                //delete one register for id
                return Dismissible(
                  key: UniqueKey(),
                  background: Container(color: Colors.grey),
                  onDismissed: (diretion) {
                    ClientDatabaseProvider.db.deleteCodeWithId(item.barcode);
                  },
                  //Now we paint the list with all the records, which will have a number, name, phone
                  child: ListTile(
                    title: Text(item.Descripcion),
                    subtitle: Text(item.barcode),
                    leading: CircleAvatar(child: Icon(Icons.check_circle)),
                    //If we press one of the cards, it takes us to the page to edit, with the data onTap:
                    //This method is in the file add_editclient.dart
                    onTap: () {
                      //ADD EVENTO AL PRESSIONAR CODIGO
                    },
                  ),
                );
              },
            );
          }else {
            return Center(
              child: Text('No hay codigos registrados',
              ),

              /*child: CircularProgressIndicator()*/);
          }
        },
      ),
    );
  }
}

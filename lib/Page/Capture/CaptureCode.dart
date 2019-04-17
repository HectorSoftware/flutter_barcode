import 'dart:async';

import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode/Page/Sqlite/BarCodeClass.dart';
import 'package:flutter_barcode/Page/Sqlite/database_helper.dart';
import 'package:flutter_barcode/main.dart';


class Capture extends StatefulWidget {
  @override
  CaptureState createState() {
    return new CaptureState();
  }
}

class CaptureState extends State<Capture> {
  String result = "Presione para Escanear...";
  String result2 = "";
  bool entro = false;

  Future _scanQR() async {
    try {
      String qrResult = await BarcodeScanner.scan();
      setState(() {
        result = qrResult;
        entro = true;
      });
    } on PlatformException catch (ex) {
      if (ex.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          result = "Permiso de la cámara fue denegado";
          entro = false;
        });
      } else {
        setState(() {
          result = "Error desconocido : $ex";
          entro = false;
        });
      }
    } on FormatException {
      setState(() {
        result = "Presione para Escanear...";
        entro = false;
      });
    } catch (ex) {
      setState(() {
        result = "Error desconocido : $ex";
        entro = false;
      });
    }
  }

  Future VentanaGuardar() async {
    final _formKey = GlobalKey<FormState>();
    await showDialog(
        context: context,
        // ignore: deprecated_member_use
        child: SimpleDialog(
          title: Text(''),
            children: <Widget>[
              Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: TextFormField(
                          decoration: new InputDecoration(
                              labelText: 'Descripción',
                              fillColor: Colors.teal[700],
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(20.0),
                                borderSide: new BorderSide(),
                              )
                          ),
                          validator: (value) {
                            result2 = "";
                            if (value.isEmpty) {
                              return 'Por favor inserte un texto';
                            }else{
                              setState(() {
                                result2 = value;
                              });
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RaisedButton(
                          color: PrimaryColor,
                          textColor: Colors.white,
                          child: Text("Guardar"),
                          onPressed: (){
                            if (_formKey.currentState.validate()){
                              Navigator.pop(context);
                              BarCode agregar = new BarCode(barcode: result,Descripcion: result2);
                              ClientDatabaseProvider.db.addCodeToDatabase(agregar);
                              //Scaffold.of(context).showSnackBar(SnackBar(content: Text('Processing Data')));
                              setState(() {
                                result = "Presione para Escanear...";
                                entro = false;
                              });

                            }
                          },
                        ),
                      ),
                    ],
                  ),
              ),
            ]
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          result,
          style: new TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton:Container(
        width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: FloatingActionButton.extended(
                  icon: Icon(Icons.camera_alt),
                  label: Text("Escanear"),
                  onPressed: _scanQR,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0),
                child: FloatingActionButton.extended(
                  icon: Icon(Icons.save),
                  label: Text("Procesar"),
                  onPressed: (){
                    if(!entro){ VentanaGuardar(); }
                  },
                ),
              ),
            ],
          )
      )
    );
  }
}

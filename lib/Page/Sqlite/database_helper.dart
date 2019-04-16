import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter_barcode/Page/Sqlite/BarCodeClass.dart';
import 'package:sqflite/sql.dart';
import 'package:sqflite/sqlite_api.dart';

class ClientDatabaseProvider{
  ClientDatabaseProvider._();

  static final  ClientDatabaseProvider db = ClientDatabaseProvider._();
  Database _database;

  //para evitar que abra varias conexciones una y otra vez podemos usar algo como esto..
  Future<Database> get database async {
    if(_database != null) return _database;
    _database = await getDatabaseInstanace();
    return _database;
  }

  Future<Database> getDatabaseInstanace() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "CodesBar.db");
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          await db.execute("CREATE TABLE CODIGOS ("
              "Barcode TEXT primary key,"
              "Descripcion TEXT,"
              ")");
        });
  }
  //Query
  //muestra todos los clientes de la base de datos
  Future<List<BarCode>> getAllCodes() async {
    final db = await database;
    var response = await db.query("CODIGOS");
    List<BarCode> list = response.map((c) => BarCode.fromMap(c)).toList();
    return list;
  }

  //Query
  //muestra un solo cliente por el id la base de datos
  Future<BarCode> getCodeId(String codigo) async {
    final db = await database;
    var response = await db.query("CODIGOS", where: "Barcode = ?", whereArgs: [codigo]);
    return response.isNotEmpty ? BarCode.fromMap(response.first) : null;
  }

  //Insert
  addCodeToDatabase(BarCode bar) async {
    final db = await database;
    var table = await db.rawQuery("SELECT MAX(id)+1 as id FROM CODIGOS");
    String id = table.first["Barcode"];
    bar.barcode = id;
    var raw = await db.insert(
      "CODIGOS",
      bar.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return raw;
  }
  //Delete
  //Delete client with id
  deleteCodeWithId(String barcode) async {
    final db = await database;
    return db.delete("CODIGOS", where: "Barcode = ?", whereArgs: [barcode]);
  }

  //Update
  updateCode(BarCode bar) async {
    final db = await database;
    var response = await db.update("CODIGOS", bar.toMap(),
        where: "Barcode = ?", whereArgs: [bar.barcode]);
    return response;
  }

}
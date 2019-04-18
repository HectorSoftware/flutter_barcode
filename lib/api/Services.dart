import 'package:flutter_barcode/Page/Sqlite/BarCodeClass.dart';
import 'package:flutter_barcode/api/protos/invoice.pb.dart';
import 'package:flutter_barcode/api/protos/invoice.pbenum.dart';
import 'package:flutter_barcode/api/protos/invoice.pbgrpc.dart';
import 'package:flutter_barcode/api/protos/invoice.pbjson.dart';
import 'package:grpc/grpc.dart';
import 'package:protobuf/protobuf.dart';

var InvoicesStub;
var channel;

class Services{

  Future<Null> ConnectionTest(String ip, int port) {

    channel = new ClientChannel(ip,
        port: port,
        options: const ChannelOptions(
            credentials: const ChannelCredentials.insecure()));
    InvoicesStub = new InvoiceServiceClient(channel);
    print('Conexión exitosa con el servidor');
  }
   Future<Null> CloseTest() async{ await channel.shutdown();  }

  Future<List<BarCode>> GetInvoiceAndSave(String codigo, String Descripcion) async{
    List<BarCode> codigos = new List<BarCode>();
    var request = new ListInvoicesRequest();
    try{
      var response = await InvoicesStub.listInvoices(request);

      int index = 0;
      for(var value in response.invoices){
        print(value);

        List<String> list_dateFrom = new List<String>();
        for(var v in value.dateFrom){
          print(v);
        }

        //BarCode varlocal = BarCode(id: index,barcode: codigo,Descripcion: Descripcion,total: value.total,status: value.status,dateFrom: ,DateTo: ,Month: ,ExpirationDate: ,Year: ;
        index++;
      }

    }catch(e){
      print(e.toString());
    }
  }

}
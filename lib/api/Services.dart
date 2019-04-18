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

   Future<List<BarCode>> TraerInvoice(String codigo) async{
    List<BarCode> codigos = new List<BarCode>();

     var request = new ListInvoicesRequest();
      try{
        var response = await InvoicesStub.listInvoices(request);
        print(response);
      }catch(e){
        print(e.toString());
      }
   }

}
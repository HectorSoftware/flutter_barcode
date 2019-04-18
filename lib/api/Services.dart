import 'package:flutter_barcode/Page/Sqlite/BarCodeClass.dart';
import 'package:flutter_barcode/Page/Sqlite/InvoicesClass.dart';
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

  Future<List<InvoicesCode>> GetInvoiceAndSave(String codigo) async{
    List<InvoicesCode> codigos = new List<InvoicesCode>();
    var request = new ListInvoicesRequest()
    ..serviceNumber = codigo;
    try{
      var response = await InvoicesStub.listInvoices(request);

      int index = 0;
      for(var value in response.invoices){
        print(value);

        List<String> list_dateFrom = new List<String>();
        list_dateFrom.add(value.dateFrom.year);
        list_dateFrom.add(value.dateFrom.month);
        list_dateFrom.add(value.dateFrom.day);

        List<String> list_dateTo = new List<String>();
        list_dateTo.add(value.dateFrom.year);
        list_dateTo.add(value.dateFrom.month);
        list_dateTo.add(value.dateFrom.day);

        List<String> list_expirationDate = new List<String>();
        list_expirationDate.add(value.dateFrom.year);
        list_expirationDate.add(value.dateFrom.month);
        list_expirationDate.add(value.dateFrom.day);

        InvoicesCode varlocal = InvoicesCode(
            total: value.total,
            status: value.status,
            dateFrom: list_dateFrom,
            DateTo: list_dateTo,
            Month: value.month,
            ExpirationDate: list_expirationDate,
            Year: value.year
        );

        index++;
        codigos.add(varlocal);
      }

    }catch(e){
      print(e.toString());
    }
  }

}
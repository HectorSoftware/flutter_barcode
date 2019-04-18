///
//  Generated code. Do not modify.
//  source: api/protos/invoice.proto
///
// ignore_for_file: non_constant_identifier_names,library_prefixes,unused_import

import 'dart:async' as $async;

import 'package:grpc/service_api.dart' as $grpc;
import 'invoice.pb.dart';
export 'invoice.pb.dart';

class InvoiceServiceClient extends $grpc.Client {
  static final _$listInvoices =
      new $grpc.ClientMethod<ListInvoicesRequest, ListInvoicesResponse>(
          '/cfe_clone.api.InvoiceService/ListInvoices',
          (ListInvoicesRequest value) => value.writeToBuffer(),
          (List<int> value) => new ListInvoicesResponse.fromBuffer(value));

  InvoiceServiceClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<ListInvoicesResponse> listInvoices(
      ListInvoicesRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$listInvoices, new $async.Stream.fromIterable([request]),
        options: options);
    return new $grpc.ResponseFuture(call);
  }
}

abstract class InvoiceServiceBase extends $grpc.Service {
  String get $name => 'cfe_clone.api.InvoiceService';

  InvoiceServiceBase() {
    $addMethod(
        new $grpc.ServiceMethod<ListInvoicesRequest, ListInvoicesResponse>(
            'ListInvoices',
            listInvoices_Pre,
            false,
            false,
            (List<int> value) => new ListInvoicesRequest.fromBuffer(value),
            (ListInvoicesResponse value) => value.writeToBuffer()));
  }

  $async.Future<ListInvoicesResponse> listInvoices_Pre(
      $grpc.ServiceCall call, $async.Future request) async {
    return listInvoices(call, await request);
  }

  $async.Future<ListInvoicesResponse> listInvoices(
      $grpc.ServiceCall call, ListInvoicesRequest request);
}

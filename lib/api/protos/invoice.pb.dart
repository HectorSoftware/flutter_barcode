///
//  Generated code. Do not modify.
//  source: api/protos/invoice.proto
///
// ignore_for_file: non_constant_identifier_names,library_prefixes,unused_import

// ignore: UNUSED_SHOWN_NAME
import 'dart:core' show int, bool, double, String, List, Map, override;

import 'package:protobuf/protobuf.dart' as $pb;

import 'invoice.pbenum.dart';

export 'invoice.pbenum.dart';

class Date extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('Date', package: const $pb.PackageName('cfe_clone.api'))
    ..a<int>(1, 'year', $pb.PbFieldType.O3)
    ..a<int>(2, 'month', $pb.PbFieldType.O3)
    ..a<int>(3, 'day', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  Date() : super();
  Date.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  Date.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  Date clone() => new Date()..mergeFromMessage(this);
  Date copyWith(void Function(Date) updates) => super.copyWith((message) => updates(message as Date));
  $pb.BuilderInfo get info_ => _i;
  static Date create() => new Date();
  Date createEmptyInstance() => create();
  static $pb.PbList<Date> createRepeated() => new $pb.PbList<Date>();
  static Date getDefault() => _defaultInstance ??= create()..freeze();
  static Date _defaultInstance;

  int get year => $_get(0, 0);
  set year(int v) { $_setSignedInt32(0, v); }
  bool hasYear() => $_has(0);
  void clearYear() => clearField(1);

  int get month => $_get(1, 0);
  set month(int v) { $_setSignedInt32(1, v); }
  bool hasMonth() => $_has(1);
  void clearMonth() => clearField(2);

  int get day => $_get(2, 0);
  set day(int v) { $_setSignedInt32(2, v); }
  bool hasDay() => $_has(2);
  void clearDay() => clearField(3);
}

class Invoice extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('Invoice', package: const $pb.PackageName('cfe_clone.api'))
    ..a<double>(1, 'total', $pb.PbFieldType.OD)
    ..aOS(2, 'status')
    ..a<Date>(3, 'dateFrom', $pb.PbFieldType.OM, Date.getDefault, Date.create)
    ..a<Date>(4, 'dateTo', $pb.PbFieldType.OM, Date.getDefault, Date.create)
    ..e<Month>(5, 'month', $pb.PbFieldType.OE, Month.MONTH_INVALID, Month.valueOf, Month.values)
    ..a<Date>(6, 'expirationDate', $pb.PbFieldType.OM, Date.getDefault, Date.create)
    ..a<int>(7, 'year', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  Invoice() : super();
  Invoice.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  Invoice.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  Invoice clone() => new Invoice()..mergeFromMessage(this);
  Invoice copyWith(void Function(Invoice) updates) => super.copyWith((message) => updates(message as Invoice));
  $pb.BuilderInfo get info_ => _i;
  static Invoice create() => new Invoice();
  Invoice createEmptyInstance() => create();
  static $pb.PbList<Invoice> createRepeated() => new $pb.PbList<Invoice>();
  static Invoice getDefault() => _defaultInstance ??= create()..freeze();
  static Invoice _defaultInstance;

  double get total => $_getN(0);
  set total(double v) { $_setDouble(0, v); }
  bool hasTotal() => $_has(0);
  void clearTotal() => clearField(1);

  String get status => $_getS(1, '');
  set status(String v) { $_setString(1, v); }
  bool hasStatus() => $_has(1);
  void clearStatus() => clearField(2);

  Date get dateFrom => $_getN(2);
  set dateFrom(Date v) { setField(3, v); }
  bool hasDateFrom() => $_has(2);
  void clearDateFrom() => clearField(3);

  Date get dateTo => $_getN(3);
  set dateTo(Date v) { setField(4, v); }
  bool hasDateTo() => $_has(3);
  void clearDateTo() => clearField(4);

  Month get month => $_getN(4);
  set month(Month v) { setField(5, v); }
  bool hasMonth() => $_has(4);
  void clearMonth() => clearField(5);

  Date get expirationDate => $_getN(5);
  set expirationDate(Date v) { setField(6, v); }
  bool hasExpirationDate() => $_has(5);
  void clearExpirationDate() => clearField(6);

  int get year => $_get(6, 0);
  set year(int v) { $_setSignedInt32(6, v); }
  bool hasYear() => $_has(6);
  void clearYear() => clearField(7);
}

class ListInvoicesRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('ListInvoicesRequest', package: const $pb.PackageName('cfe_clone.api'))
    ..aOS(1, 'serviceNumber')
    ..hasRequiredFields = false
  ;

  ListInvoicesRequest() : super();
  ListInvoicesRequest.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  ListInvoicesRequest.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  ListInvoicesRequest clone() => new ListInvoicesRequest()..mergeFromMessage(this);
  ListInvoicesRequest copyWith(void Function(ListInvoicesRequest) updates) => super.copyWith((message) => updates(message as ListInvoicesRequest));
  $pb.BuilderInfo get info_ => _i;
  static ListInvoicesRequest create() => new ListInvoicesRequest();
  ListInvoicesRequest createEmptyInstance() => create();
  static $pb.PbList<ListInvoicesRequest> createRepeated() => new $pb.PbList<ListInvoicesRequest>();
  static ListInvoicesRequest getDefault() => _defaultInstance ??= create()..freeze();
  static ListInvoicesRequest _defaultInstance;

  String get serviceNumber => $_getS(0, '');
  set serviceNumber(String v) { $_setString(0, v); }
  bool hasServiceNumber() => $_has(0);
  void clearServiceNumber() => clearField(1);
}

class ListInvoicesResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('ListInvoicesResponse', package: const $pb.PackageName('cfe_clone.api'))
    ..pc<Invoice>(1, 'invoices', $pb.PbFieldType.PM,Invoice.create)
    ..hasRequiredFields = false
  ;

  ListInvoicesResponse() : super();
  ListInvoicesResponse.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  ListInvoicesResponse.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  ListInvoicesResponse clone() => new ListInvoicesResponse()..mergeFromMessage(this);
  ListInvoicesResponse copyWith(void Function(ListInvoicesResponse) updates) => super.copyWith((message) => updates(message as ListInvoicesResponse));
  $pb.BuilderInfo get info_ => _i;
  static ListInvoicesResponse create() => new ListInvoicesResponse();
  ListInvoicesResponse createEmptyInstance() => create();
  static $pb.PbList<ListInvoicesResponse> createRepeated() => new $pb.PbList<ListInvoicesResponse>();
  static ListInvoicesResponse getDefault() => _defaultInstance ??= create()..freeze();
  static ListInvoicesResponse _defaultInstance;

  List<Invoice> get invoices => $_getList(0);
}


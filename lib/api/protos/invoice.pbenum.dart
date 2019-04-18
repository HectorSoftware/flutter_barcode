///
//  Generated code. Do not modify.
//  source: api/protos/invoice.proto
///
// ignore_for_file: non_constant_identifier_names,library_prefixes,unused_import

// ignore_for_file: UNDEFINED_SHOWN_NAME,UNUSED_SHOWN_NAME
import 'dart:core' show int, dynamic, String, List, Map;
import 'package:protobuf/protobuf.dart' as $pb;

class Month extends $pb.ProtobufEnum {
  static const Month MONTH_INVALID = const Month._(0, 'MONTH_INVALID');
  static const Month MONTH_JANUARY = const Month._(1, 'MONTH_JANUARY');
  static const Month MONTH_FEBRUARY = const Month._(2, 'MONTH_FEBRUARY');
  static const Month MONTH_MARCH = const Month._(3, 'MONTH_MARCH');
  static const Month MONTH_APRIL = const Month._(4, 'MONTH_APRIL');
  static const Month MONTH_MAY = const Month._(5, 'MONTH_MAY');
  static const Month MONTH_JUNE = const Month._(6, 'MONTH_JUNE');
  static const Month MONTH_JULY = const Month._(7, 'MONTH_JULY');
  static const Month MONTH_AUGUST = const Month._(8, 'MONTH_AUGUST');
  static const Month MONTH_SEPTEMBER = const Month._(9, 'MONTH_SEPTEMBER');
  static const Month MONTH_OCTOBER = const Month._(10, 'MONTH_OCTOBER');
  static const Month MONTH_NOVEMBER = const Month._(11, 'MONTH_NOVEMBER');
  static const Month MONTH_DECEMBER = const Month._(12, 'MONTH_DECEMBER');

  static const List<Month> values = const <Month> [
    MONTH_INVALID,
    MONTH_JANUARY,
    MONTH_FEBRUARY,
    MONTH_MARCH,
    MONTH_APRIL,
    MONTH_MAY,
    MONTH_JUNE,
    MONTH_JULY,
    MONTH_AUGUST,
    MONTH_SEPTEMBER,
    MONTH_OCTOBER,
    MONTH_NOVEMBER,
    MONTH_DECEMBER,
  ];

  static final Map<int, Month> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Month valueOf(int value) => _byValue[value];

  const Month._(int v, String n) : super(v, n);
}


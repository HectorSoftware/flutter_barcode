///
//  Generated code. Do not modify.
//  source: api/protos/invoice.proto
///
// ignore_for_file: non_constant_identifier_names,library_prefixes,unused_import

const Month$json = const {
  '1': 'Month',
  '2': const [
    const {'1': 'MONTH_INVALID', '2': 0},
    const {'1': 'MONTH_JANUARY', '2': 1},
    const {'1': 'MONTH_FEBRUARY', '2': 2},
    const {'1': 'MONTH_MARCH', '2': 3},
    const {'1': 'MONTH_APRIL', '2': 4},
    const {'1': 'MONTH_MAY', '2': 5},
    const {'1': 'MONTH_JUNE', '2': 6},
    const {'1': 'MONTH_JULY', '2': 7},
    const {'1': 'MONTH_AUGUST', '2': 8},
    const {'1': 'MONTH_SEPTEMBER', '2': 9},
    const {'1': 'MONTH_OCTOBER', '2': 10},
    const {'1': 'MONTH_NOVEMBER', '2': 11},
    const {'1': 'MONTH_DECEMBER', '2': 12},
  ],
};

const Date$json = const {
  '1': 'Date',
  '2': const [
    const {'1': 'year', '3': 1, '4': 1, '5': 5, '10': 'year'},
    const {'1': 'month', '3': 2, '4': 1, '5': 5, '10': 'month'},
    const {'1': 'day', '3': 3, '4': 1, '5': 5, '10': 'day'},
  ],
};

const Invoice$json = const {
  '1': 'Invoice',
  '2': const [
    const {'1': 'total', '3': 1, '4': 1, '5': 1, '10': 'total'},
    const {'1': 'status', '3': 2, '4': 1, '5': 9, '10': 'status'},
    const {'1': 'date_from', '3': 3, '4': 1, '5': 11, '6': '.cfe_clone.api.Date', '10': 'dateFrom'},
    const {'1': 'date_to', '3': 4, '4': 1, '5': 11, '6': '.cfe_clone.api.Date', '10': 'dateTo'},
    const {'1': 'month', '3': 5, '4': 1, '5': 14, '6': '.cfe_clone.api.Month', '10': 'month'},
    const {'1': 'expiration_date', '3': 6, '4': 1, '5': 11, '6': '.cfe_clone.api.Date', '10': 'expirationDate'},
    const {'1': 'year', '3': 7, '4': 1, '5': 5, '10': 'year'},
  ],
};

const ListInvoicesRequest$json = const {
  '1': 'ListInvoicesRequest',
  '2': const [
    const {'1': 'service_number', '3': 1, '4': 1, '5': 9, '10': 'serviceNumber'},
  ],
};

const ListInvoicesResponse$json = const {
  '1': 'ListInvoicesResponse',
  '2': const [
    const {'1': 'invoices', '3': 1, '4': 3, '5': 11, '6': '.cfe_clone.api.Invoice', '10': 'invoices'},
  ],
};


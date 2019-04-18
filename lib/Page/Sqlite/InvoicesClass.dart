class InvoicesCode{
  double total;
  String status;
  List<String> dateFrom;
  List<String> DateTo;
  String Month;
  List<String> ExpirationDate;
  String Year;

  InvoicesCode ({this.total,this.status,this.dateFrom,this.DateTo,this.Month,this.ExpirationDate,this.Year});

  //To insert the data in the bd, we need to convert it into a Map
  //Para insertar los datos en la bd, necesitamos convertirlo en un Map
  Map<String, dynamic> toMap() => {
    "total": total,
    "status": status,
    "dateFrom": dateFrom,
    "DateTo": DateTo,
    "Month": Month,
    "ExpirationDate": ExpirationDate,
    "Year": Year,
  };
  //to receive the data we need to pass it from Map to json
  //para recibir los datos necesitamos pasarlo de Map a json
  factory InvoicesCode.fromMap(Map<String, dynamic> json) => new InvoicesCode(
    total: json["total"],
    status: json["status"],
    dateFrom: json["dateFrom"],
    DateTo: json["DateTo"],
    Month: json["Month"],
    ExpirationDate: json["ExpirationDate"],
    Year: json["Year"],
  );
}
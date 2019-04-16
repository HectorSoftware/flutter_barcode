class BarCode{
  String barcode;
  String Descripcion;

  BarCode ({this.barcode, this.Descripcion});

  //To insert the data in the bd, we need to convert it into a Map
  //Para insertar los datos en la bd, necesitamos convertirlo en un Map
  Map<String, dynamic> toMap() => {
    "Barcode": barcode,
    "Descripcion": Descripcion,
  };
  //to receive the data we need to pass it from Map to json
  //para recibir los datos necesitamos pasarlo de Map a json
  factory BarCode.fromMap(Map<String, dynamic> json) => new BarCode(
    barcode: json["Barcode"],
    Descripcion: json["Descripcion"],
  );
}
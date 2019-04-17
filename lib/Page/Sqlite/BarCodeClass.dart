class BarCode{
  int id;
  String barcode;
  String Descripcion;

  BarCode ({this.id,this.barcode, this.Descripcion});

  //To insert the data in the bd, we need to convert it into a Map
  //Para insertar los datos en la bd, necesitamos convertirlo en un Map
  Map<String, dynamic> toMap() => {
    "id" : id,
    "Barcode": barcode,
    "Descripcion": Descripcion,
  };
  //to receive the data we need to pass it from Map to json
  //para recibir los datos necesitamos pasarlo de Map a json
  factory BarCode.fromMap(Map<String, dynamic> json) => new BarCode(
    id: json["id"],
    barcode: json["Barcode"],
    Descripcion: json["Descripcion"],
  );
}
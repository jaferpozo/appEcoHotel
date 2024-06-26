part of 'models.dart';
SeleccionPuntosModel seleccionPuntosModelFromJson(String str) => SeleccionPuntosModel.fromJson(json.decode(str));
String seleccionPuntosModelToJson(SeleccionPuntosModel data) => json.encode(data.toJson());
class SeleccionPuntosModel {
  SeleccionPuntosModel({
    required this.idUpcTipoBien,
  });

  IdUpcTipoBien idUpcTipoBien;

  factory SeleccionPuntosModel.fromJson(Map<String, dynamic> json) => SeleccionPuntosModel(
    idUpcTipoBien: IdUpcTipoBien.fromJson(json["idUpcTipoBien"]),
  );

  Map<String, dynamic> toJson() => {
    "idUpcTipoBien": idUpcTipoBien.toJson(),
  };
}

class IdUpcTipoBien {
  IdUpcTipoBien({
    required this.codeError,
    required this.msj,
    required this.seleccionPunto,
  });

  int codeError;
  String msj;
  List<SeleccionPunto> seleccionPunto;

  factory IdUpcTipoBien.fromJson(Map<String, dynamic> json) => IdUpcTipoBien(
    codeError: json["codeError"],
    msj: json["msj"],
    seleccionPunto: List<SeleccionPunto>.from(json["datos"].map((x) => SeleccionPunto.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "codeError": codeError,
    "msj": msj,
    "datos": List<dynamic>.from(seleccionPunto.map((x) => x.toJson())),
  };
}

class SeleccionPunto {
  SeleccionPunto({
    required this.idUpcTipoBien,
    required this.tbDescripcion,
    required this.latitud,
    required this.longitud,
    required this.direccion,
    required this.nomEntidad,
  });

  String idUpcTipoBien;
  String tbDescripcion;
  String latitud;
  String longitud;
  String direccion;
  String nomEntidad;

  factory SeleccionPunto.fromJson(Map<String, dynamic> json) => SeleccionPunto(
    idUpcTipoBien: ParseModel.parseToString(json["idUpcTipoBien"]),
    tbDescripcion: json["tbDescripcion"] == null ? '' : json["tbDescripcion"],
    latitud: json["latitud"],
    longitud: json["longitud"],
    direccion:json["direccion"] == null ? '' : json["direccion"],
    nomEntidad: json["nomEntidad"] == null ? '' : json["nomEntidad"],
  );

  Map<String, dynamic> toJson() => {
    "idUpcTipoBien": idUpcTipoBien,
    "tbDescripcion": tbDescripcion,
    "latitud": latitud,
    "longitud": longitud,
    "direccion": direccion,
    "nomEntidad": nomEntidad,
  };
}

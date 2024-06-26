part of 'models.dart';
DelitoTotalModel delitoTotalModelFromJson(String str) => DelitoTotalModel.fromJson(json.decode(str));

String delitoTotalModelToJson(DelitoTotalModel data) => json.encode(data.toJson());

class DelitoTotalModel {
  DelitoTotalModel({
    required this.delitosTotales,
  });

  DelitosTotales delitosTotales;

  factory DelitoTotalModel.fromJson(Map<String, dynamic> json) => DelitoTotalModel(
    delitosTotales: DelitosTotales.fromJson(json["delitosTotales"]),
  );

  Map<String, dynamic> toJson() => {
    "delitosTotales": delitosTotales.toJson(),
  };
}

class DelitosTotales {
  DelitosTotales({
    required this.codeError,
    required this.msj,
    required this.delTotal,
  });

  int codeError;
  String msj;
  List<DelTotal> delTotal;

  factory DelitosTotales.fromJson(Map<String, dynamic> json) => DelitosTotales(
    codeError: json["codeError"],
    msj: json["msj"],
    delTotal: List<DelTotal>.from(json["datos"].map((x) => DelTotal.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "codeError": codeError,
    "msj": msj,
    "datos": List<dynamic>.from(delTotal.map((x) => x.toJson())),
  };
}

class DelTotal {
  DelTotal({
    required this.idDaiDelCom,
    required this.idDaiDelito,
    required this.idGenGeoSenplades,
    required this.descDelito,
    required this.descModalidad,
    required this.descSubCatLugar,
    required this.latitudDelito,
    required this.longitudDelito,
    required this.descripcion,
    required this.fechaDelito,
    required this.direccionDelito,
    required this.imgDelito,
  });

  String idDaiDelCom;
  String idDaiDelito;
  String idGenGeoSenplades;
  String descDelito;
  String descModalidad;
  String descSubCatLugar;
  String latitudDelito;
  String longitudDelito;
  String descripcion;
  String fechaDelito;
  String direccionDelito;
  String imgDelito;

  factory DelTotal.fromJson(Map<String, dynamic> json) => DelTotal(
    idDaiDelCom: ParseModel.parseToString(json["idDaiDelCom"]),
    idDaiDelito: ParseModel.parseToString(json["idDaiDelito"]),
    idGenGeoSenplades: ParseModel.parseToString(json["idGenGeoSenplades"]),
    descDelito: json["descDelito"] == null ? '' :json["descDelito"],
    descModalidad: json["descModalidad"] == null ? '' : json["descModalidad"],
    descSubCatLugar: json["descSubCatLugar"] == null ? '' : json["descSubCatLugar"],
    latitudDelito: json["latitudDelito"],
    longitudDelito: json["longitudDelito"],
    descripcion: json["descripcion"] == null ? '' :json["descripcion"],
    fechaDelito: json["fechaDelito"] == null ? '' :json["fechaDelito"],
    direccionDelito: json["direccionDelito"] == null ? '' : json["direccionDelito"],
    imgDelito: json["imgDelito"] == null ? '' : json["imgDelito"],
  );

  Map<String, dynamic> toJson() => {
    "idDaiDelCom": idDaiDelCom,
    "idDaiDelito": idDaiDelito,
    "idGenGeoSenplades": idGenGeoSenplades,
    "descDelito": descDelito,
    "descModalidad": descModalidad,
    "descSubCatLugar": descSubCatLugar,
    "latitudDelito": latitudDelito,
    "longitudDelito": longitudDelito,
    "descripcion": descripcion,
    "fechaDelito": fechaDelito,
    "direccionDelito": direccionDelito,
    "imgDelito": imgDelito,
  };
}

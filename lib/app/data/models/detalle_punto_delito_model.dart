part of 'models.dart';
DetallePuntoDelitoModel detallePuntoDelitoModelFromJson(String str) => DetallePuntoDelitoModel.fromJson(json.decode(str));

String detallePuntoDelitoModelToJson(DetallePuntoDelitoModel data) => json.encode(data.toJson());

class DetallePuntoDelitoModel {
  PuntoDelito puntoDelito;

  DetallePuntoDelitoModel({
    required this.puntoDelito,
  });

  factory DetallePuntoDelitoModel.fromJson(Map<String, dynamic> json) => DetallePuntoDelitoModel(
    puntoDelito: PuntoDelito.fromJson(json["puntoDelito"]),
  );

  Map<String, dynamic> toJson() => {
    "puntoDelito": puntoDelito.toJson(),
  };
}

class PuntoDelito {
  int codeError;
  String msj;
  List<DetallePunto> detallePunto;

  PuntoDelito({
    required this.codeError,
    required this.msj,
    required this.detallePunto,
  });

  factory PuntoDelito.fromJson(Map<String, dynamic> json) => PuntoDelito(
    codeError: json["codeError"],
    msj: json["msj"],
    detallePunto: List<DetallePunto>.from(json["datos"].map((x) => DetallePunto.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "codeError": codeError,
    "msj": msj,
    "datos": List<dynamic>.from(detallePunto.map((x) => x.toJson())),
  };
}

class DetallePunto {
  String idDaiDelCom;
  String numero;
  String descModalidad;
  String descArma;
  String descSubCatLugar;
  String descripcion;
  String descDelito;
  String distance;

  DetallePunto({
    required this.idDaiDelCom,
    required this.numero,
    required this.descModalidad,
    required this.descArma,
    required this.descSubCatLugar,
    required this.descripcion,
    required this.descDelito,
    required this.distance,
  });

  factory DetallePunto.fromJson(Map<String, dynamic> json) => DetallePunto(
    idDaiDelCom: ParseModel.parseToString(json["idDaiDelCom"]),
    numero: ParseModel.parseToString(json["numero"]),
    descModalidad: json["descModalidad"]==null?'':json["descModalidad"],
    descArma: json["descArma"]==null?'':json["descArma"],
    descSubCatLugar: json["descSubCatLugar"]==null?'':json["descSubCatLugar"],
    descripcion: json["descripcion"]==null?'':json["descripcion"],
    descDelito: json["descDelito"]==null?'':json["descDelito"],
    distance: ParseModel.parseToString(json["distance"]),
  );

  Map<String, dynamic> toJson() => {
    "idDaiDelCom": idDaiDelCom,
    "numero": numero,
    "descModalidad": descModalidad,
    "descArma": descArma,
    "descSubCatLugar": descSubCatLugar,
    "descripcion": descripcion,
    "descDelito": descDelito,
    "distance": distance,
  };
}

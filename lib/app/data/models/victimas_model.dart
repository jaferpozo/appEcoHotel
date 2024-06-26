part of 'models.dart';
VictimasModel victimasModelFromJson(String str) => VictimasModel.fromJson(json.decode(str));

String victimasModelToJson(VictimasModel data) => json.encode(data.toJson());

class VictimasModel {
  VictimasModel({
    required this.daiVictimaD,
  });

  DaiVictimaD daiVictimaD;

  factory VictimasModel.fromJson(Map<String, dynamic> json) => VictimasModel(
    daiVictimaD: DaiVictimaD.fromJson(json["daiVictimaD"]),
  );

  Map<String, dynamic> toJson() => {
    "daiVictimaD": daiVictimaD.toJson(),
  };
}

class DaiVictimaD {
  DaiVictimaD({
    required this.codeError,
    required this.msj,
    required this.victimas,
  });

  int codeError;
  String msj;
  List<Victima> victimas;

  factory DaiVictimaD.fromJson(Map<String, dynamic> json) => DaiVictimaD(
    codeError: json["codeError"],
    msj: json["msj"],
    victimas: List<Victima>.from(json["datos"].map((x) => Victima.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "codeError": codeError,
    "msj": msj,
    "datos": List<dynamic>.from(victimas.map((x) => x.toJson())),
  };
}

class Victima {
  Victima({
    required this.idDaiDelCom,
    required this.distance,
    required this.total,
    required this.edadVictima,
    required this.genero,
    required this.edadV,
    required this.sexoVictima,
    required this.descDelito,
    required this.descModalidad,
    required this.descSubCatLugar,
    required this.descArma,
    required this.descVehiculo,
    required this.eCivilVictima,
    required this.latitudDelito,
    required this.longitudDelito,
  });

  String idDaiDelCom;
  String distance;
  String total;
  String edadVictima;
  String genero;
  String edadV;
  String sexoVictima;
  dynamic descDelito;
  String descModalidad;
  String descSubCatLugar;
  String descArma;
  String descVehiculo;
  String eCivilVictima;
  String latitudDelito;
  String longitudDelito;

  factory Victima.fromJson(Map<String, dynamic> json) => Victima(
  idDaiDelCom: ParseModel.parseToString(json["idDaiDelCom"]),
  distance: ParseModel.parseToString(json["distance"]),
    total: ParseModel.parseToString(json["total"]),
  edadVictima: ParseModel.parseToString(json["edadVictima"]),
    genero: json["genero"] == null ? '' : json["genero"],
  edadV: ParseModel.parseToString(json["edadV"]),
    sexoVictima: json["sexoVictima"] == null ? '' : json["sexoVictima"],
    descDelito: json["descDelito"] == null ? '' : json["descDelito"],
    descModalidad: json["descModalidad"] == null ? '' : json["descModalidad"],
    descSubCatLugar: json["descSubCatLugar"] == null ? '' : json["descSubCatLugar"],
    descArma: json["descArma"] == null ? '' : json["descArma"],
    descVehiculo: json["descVehiculo"] == null ? '' : json["descVehiculo"],
    eCivilVictima: json["eCivilVictima"] == null ? '' : json["eCivilVictima"],
    latitudDelito: json["latitudDelito"],
    longitudDelito: json["longitudDelito"],
  );

  Map<String, dynamic> toJson() => {
    "idDaiDelCom": idDaiDelCom,
    "distance": distance,
    "Total": total,
    "edadVictima": edadVictima,
    "genero": genero,
    "edadV": edadV,
    "sexoVictima": sexoVictima,
    "descDelito": descDelito,
    "descModalidad": descModalidad,
    "descSubCatLugar": descSubCatLugar,
    "descArma": descArma,
    "descVehiculo": descVehiculo,
    "eCivilVictima": eCivilVictima,
    "latitudDelito": latitudDelito,
    "longitudDelito": longitudDelito,
  };
}

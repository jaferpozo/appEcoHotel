part of 'models.dart';
MuertesModel muertesModelFromJson(String str) => MuertesModel.fromJson(json.decode(str));
String muertesModelToJson(MuertesModel data) => json.encode(data.toJson());

class MuertesModel {
  MuertesModel({
    required this.daiMuertes,
  });

  DaiMuertes daiMuertes;

  factory MuertesModel.fromJson(Map<String, dynamic> json) => MuertesModel(
    daiMuertes: DaiMuertes.fromJson(json["daiMuertes"]),
  );

  Map<String, dynamic> toJson() => {
    "daiMuertes": daiMuertes.toJson(),
  };
}

class DaiMuertes {
  DaiMuertes({
    required this.codeError,
    required this.msj,
    required this.muertes,
  });

  int codeError;
  String msj;
  List<Muerte> muertes;

  factory DaiMuertes.fromJson(Map<String, dynamic> json) => DaiMuertes(
    codeError: json["codeError"],
    msj: json["msj"],
    muertes: List<Muerte>.from(json["datos"].map((x) => Muerte.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "codeError": codeError,
    "msj": msj,
    "datos": List<dynamic>.from(muertes.map((x) => x.toJson())),
  };
}

class Muerte {
  Muerte({
    required this.idVictima,
    required this.sexo,
    required this.arma,
    required this.motivacion,
    required this.tipoMuerte,
    required this.horaInfraccion,
    required this.fechaInfraccion,
    required this.lugar,
    required this.areaHecho,
    required this.latitud,
    required this.longitud,
    required this.codigoSubcircuito,
    required this.nacionalidad,
  });

  String idVictima;
  String sexo;
  String arma;
  String motivacion;
  String tipoMuerte;
  String horaInfraccion;
  String fechaInfraccion;
  String lugar;
  String areaHecho;
  String latitud;
  String longitud;
  String codigoSubcircuito;
  String nacionalidad;

  factory Muerte.fromJson(Map<String, dynamic> json) => Muerte(
    idVictima: ParseModel.parseToString(json["id_victima"]),
    sexo: json["sexo"] == null ? '' : json["sexo"],
    arma: json["arma"] == null ? '' : json["arma"],
    motivacion: json["motivacion"] == null ? '' : json["motivacion"],
    tipoMuerte: json["tipoMuerte"] == null ? '' : json["tipoMuerte"],
    horaInfraccion: json["horaInfraccion"] == null ? '' : json["horaInfraccion"],
    fechaInfraccion: json["fechaInfraccion"] == null ? '' : json["fechaInfraccion"],
    lugar: json["lugar"] == null ? '' : json["lugar"],
    areaHecho: json["areaHecho"] == null ? '' : json["areaHecho"],
    nacionalidad: json["nacionalidad"] == null ? '' : json["nacionalidad"],
    latitud: json["latitud"],
    longitud: json["longitud"],
    codigoSubcircuito: ParseModel.parseToString(json["codigo_subcircuito"]),
  );

  Map<String, dynamic> toJson() => {
    "id_victima": idVictima,
    "sexo": sexo,
    "arma": arma,
    "motivacion": motivacion,
    "tipo_muerte": tipoMuerte,
    "hora_infraccion": horaInfraccion,
    "fecha_infraccion":fechaInfraccion,
    "lugar": lugar,
    "area_hecho": areaHecho,
    "latitud": latitud,
    "longitud": longitud,
    "codigo_subcircuito": codigoSubcircuito,
    "nacionalidad": nacionalidad,
  };
}

part of 'models.dart';
ReanudarRutaModel reanudarRutaModelFromJson(String str) => ReanudarRutaModel.fromJson(json.decode(str));

String reanudarRutaModelToJson(ReanudarRutaModel data) => json.encode(data.toJson());

class ReanudarRutaModel {
  DaiReanudar daiReanudar;

  ReanudarRutaModel({
    required this.daiReanudar,
  });

  factory ReanudarRutaModel.fromJson(Map<String, dynamic> json) => ReanudarRutaModel(
    daiReanudar: DaiReanudar.fromJson(json["daiReanudar"]),
  );

  Map<String, dynamic> toJson() => {
    "daiReanudar": daiReanudar.toJson(),
  };
}

class DaiReanudar {
  int codeError;
  String msj;
  List<Reanudar> reanudar;

  DaiReanudar({
    required this.codeError,
    required this.msj,
    required this.reanudar,
  });

  factory DaiReanudar.fromJson(Map<String, dynamic> json) => DaiReanudar(
    codeError: json["codeError"],
    msj: json["msj"],
    reanudar: List<Reanudar>.from(json["datos"].map((x) => Reanudar.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "codeError": codeError,
    "msj": msj,
    "datos": List<dynamic>.from(reanudar.map((x) => x.toJson())),
  };
}

class Reanudar {
  String idDaiRutaPat;
  String idDaiCentroide;
  String idGenPersona;
  String idGenGeoSenplades;
  String latIni;
  String lonIni;
  String cenLatitud;
  String cenLongitud;
  String cenDistancia;
  String filDis;
  String estado;

  Reanudar({
    required this.idDaiRutaPat,
    required this.idDaiCentroide,
    required this.idGenPersona,
    required this.idGenGeoSenplades,
    required this.latIni,
    required this.lonIni,
    required this.cenLatitud,
    required this.cenLongitud,
    required this.cenDistancia,
    required this.filDis,
    required this.estado,
  });

  factory Reanudar.fromJson(Map<String, dynamic> json) => Reanudar(
  idDaiRutaPat: ParseModel.parseToString(json["idDaiRutaPat"]),
  idDaiCentroide: ParseModel.parseToString(json["idDaiCentroide"]),
    idGenPersona: ParseModel.parseToString(json["idGenPersona"]),
    idGenGeoSenplades: ParseModel.parseToString(json["idGenGeoSenplades"]),
    latIni: json["LatIni"],
    lonIni: json["LonIni"],
    cenLatitud: json["cenLatitud"],
    cenLongitud: json["cenLongitud"],
  cenDistancia: ParseModel.parseToString(json["cenDistancia"]),
    filDis: ParseModel.parseToString(json["filDis"]),
    estado: json["estado"] == null ? '' : json["Estado"],
  );

  Map<String, dynamic> toJson() => {
    "idDaiRutaPat": idDaiRutaPat,
    "idDaiCentroide": idDaiCentroide,
    "idGenPersona": idGenPersona,
    "idGenGeoSenplades": idGenGeoSenplades,
    "LatIni": latIni,
    "LonIni": lonIni,
    "cenLatitud": cenLatitud,
    "cenLongitud": cenLongitud,
    "cenDistancia": cenDistancia,
    "filDis": filDis,
    "Estado": estado,
  };
}

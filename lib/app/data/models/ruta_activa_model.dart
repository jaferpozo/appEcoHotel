part of 'models.dart';

RutaActivaModel rutaActivaModelFromJson(String str) => RutaActivaModel.fromJson(json.decode(str));

String rutaActivaModelToJson(RutaActivaModel data) => json.encode(data.toJson());

class RutaActivaModel {
  RutaActivaModel({
    required this.daiRutaP,
  });

  DaiRutaP daiRutaP;

  factory RutaActivaModel.fromJson(Map<String, dynamic> json) => RutaActivaModel(
    daiRutaP: DaiRutaP.fromJson(json["daiRutaP"]),
  );

  Map<String, dynamic> toJson() => {
    "daiRutaP": daiRutaP.toJson(),
  };
}

class DaiRutaP {
  DaiRutaP({
    required this.codeError,
    required this.msj,
    required this.rutaActiva,
  });

  int codeError;
  String msj;
  List<RutaActiva> rutaActiva;

  factory DaiRutaP.fromJson(Map<String, dynamic> json) => DaiRutaP(
    codeError: json["codeError"],
    msj: json["msj"],
    rutaActiva: List<RutaActiva>.from(json["datos"].map((x) => RutaActiva.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "codeError": codeError,
    "msj": msj,
    "datos": List<dynamic>.from(rutaActiva.map((x) => x.toJson())),
  };
}

class RutaActiva {
  RutaActiva({
    required this.idDaiRutaPat,
    required this.idGenPersona,
    required this.horaInicio,
    required this.idGenGeoSenplades,
    required this.descripcion,
    required this.estado,
  });

  String idDaiRutaPat;
  String idGenPersona;
  String horaInicio;
  String idGenGeoSenplades;
  String descripcion;
  String estado;

  factory RutaActiva.fromJson(Map<String, dynamic> json) => RutaActiva(
  idDaiRutaPat: ParseModel.parseToString(json["idDaiRutaPat"]),
  idGenPersona: ParseModel.parseToString(json["idGenPersona"]),
      horaInicio: json["horaInicio"] == null ? '' : json["horaInicio"],
  idGenGeoSenplades: ParseModel.parseToString(json["idGenGeoSenplades"]),
      descripcion: json["descripcion"] == null ? '' : json["descripcion"],
      estado: json["estado"] == null ? '' : json["estado"],
  );

  Map<String, dynamic> toJson() => {
    "idDaiRutaPat": idDaiRutaPat,
    "idGenPersona": idGenPersona,
    "horaInicio": horaInicio,
    "idGenGeoSenplades": idGenGeoSenplades,
    "descripcion": descripcion,
    "estado": estado,
  };
}

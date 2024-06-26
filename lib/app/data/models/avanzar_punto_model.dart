part of 'models.dart';
AvanzarPuntoModel avanzarPuntoModelFromJson(String str) => AvanzarPuntoModel.fromJson(json.decode(str));

String avanzarPuntoModelToJson(AvanzarPuntoModel data) => json.encode(data.toJson());

class AvanzarPuntoModel {
  DaiAvanzar daiAvanzar;

  AvanzarPuntoModel({
    required this.daiAvanzar,
  });

  factory AvanzarPuntoModel.fromJson(Map<String, dynamic> json) => AvanzarPuntoModel(
    daiAvanzar: DaiAvanzar.fromJson(json["daiAvanzar"]),
  );

  Map<String, dynamic> toJson() => {
    "daiAvanzar": daiAvanzar.toJson(),
  };
}

class DaiAvanzar {
  int codeError;
  String msj;
  List<Avanzar> avanzar;

  DaiAvanzar({
    required this.codeError,
    required this.msj,
    required this.avanzar,
  });

  factory DaiAvanzar.fromJson(Map<String, dynamic> json) => DaiAvanzar(
    codeError: json["codeError"],
    msj: json["msj"],
    avanzar: List<Avanzar>.from(json["datos"].map((x) => Avanzar.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "codeError": codeError,
    "msj": msj,
    "datos": List<dynamic>.from(avanzar.map((x) => x.toJson())),
  };
}

class Avanzar {
  String idDaiCentroide;
  String cenLatitud;
  String cenLongitud;
  String filDis;
  String idDaiRutaPat;

  Avanzar({
    required this.idDaiCentroide,
    required this.cenLatitud,
    required this.cenLongitud,
    required this.filDis,
    required this.idDaiRutaPat,
  });

  factory Avanzar.fromJson(Map<String, dynamic> json) => Avanzar(
    idDaiCentroide: ParseModel.parseToString(json["idDaiCentroide"]),
    cenLatitud: json["cenLatitud"],
    cenLongitud: json["cenLongitud"],
    filDis: ParseModel.parseToString(json["filDis"]),
    idDaiRutaPat: ParseModel.parseToString(json["idDaiRutaPat"]),
  );

  Map<String, dynamic> toJson() => {
    "idDaiCentroide": idDaiCentroide,
    "cenLatitud": cenLatitud,
    "cenLongitud": cenLongitud,
    "filDis": filDis,
    "idDaiRutaPat": idDaiRutaPat,
  };
}

part of 'models.dart';

CentroideModel centroideModelFromJson(String str) => CentroideModel.fromJson(json.decode(str));

String centroideModelToJson(CentroideModel data) => json.encode(data.toJson());

class CentroideModel {
  CentroideModel({
    required this.daiCentroide,
  });

  DaiCentroide daiCentroide;

  factory CentroideModel.fromJson(Map<String, dynamic> json) => CentroideModel(
    daiCentroide: DaiCentroide.fromJson(json["daiCentroide"]),
  );

  Map<String, dynamic> toJson() => {
    "daiCentroide": daiCentroide.toJson(),
  };
}

class DaiCentroide {
  DaiCentroide({
    required this.codeError,
    required this.msj,
    required this.centroide,
  });

  int codeError;
  String msj;
  List<Centroide> centroide;

  factory DaiCentroide.fromJson(Map<String, dynamic> json) => DaiCentroide(
    codeError: json["codeError"],
    msj: json["msj"],
    centroide: List<Centroide>.from(json["datos"].map((x) => Centroide.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "codeError": codeError,
    "msj": msj,
    "datos": List<dynamic>.from(centroide.map((x) => x.toJson())),
  };
}

class Centroide {
  Centroide({
    required this.idDaiCentroide,
    required this.cenLatitud,
    required this.cenLongitud,
    required this.filDis,
    required this.idDaiRutaPat,
  });

  String idDaiCentroide;
  String cenLatitud;
  String cenLongitud;
  String filDis;
  String idDaiRutaPat;


  factory Centroide.fromJson(Map<String, dynamic> json) => Centroide(
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

part of 'models.dart';

FinalizarRutaModel finalizarRutaModelFromJson(String str) => FinalizarRutaModel.fromJson(json.decode(str));

String finalizarRutaModelToJson(FinalizarRutaModel data) => json.encode(data.toJson());

class FinalizarRutaModel {
  DaiFinalizar daiFinalizar;

  FinalizarRutaModel({
    required this.daiFinalizar,
  });

  factory FinalizarRutaModel.fromJson(Map<String, dynamic> json) => FinalizarRutaModel(
    daiFinalizar: DaiFinalizar.fromJson(json["daiFinalizar"]),
  );

  Map<String, dynamic> toJson() => {
    "daiFinalizar": daiFinalizar.toJson(),
  };
}

class DaiFinalizar {
  int codeError;
  String msj;
  List<Finalizar> finalizar;

  DaiFinalizar({
    required this.codeError,
    required this.msj,
    required this.finalizar,
  });

  factory DaiFinalizar.fromJson(Map<String, dynamic> json) => DaiFinalizar(
    codeError: json["codeError"],
    msj: json["msj"],
    finalizar: List<Finalizar>.from(json["datos"].map((x) => Finalizar.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "codeError": codeError,
    "msj": msj,
    "datos": List<dynamic>.from(finalizar.map((x) => x.toJson())),
  };
}

class Finalizar {
  String idDaiRutaPat;
  String inicio;
  String fin;
  String fecha;
  String distancia;
  String tiempo;
  int puntos;
  String opcion;

  Finalizar({
    required this.idDaiRutaPat,
    required this.inicio,
    required this.fin,
    required this.fecha,
    required this.distancia,
    required this.tiempo,
    required this.puntos,
    required this.opcion,
  });

  factory Finalizar.fromJson(Map<String, dynamic> json) => Finalizar(
    idDaiRutaPat: ParseModel.parseToString(json["idDaiRutaPat"]),
    inicio: json["Inicio"]==null?'':json["Inicio"],
    fin: json["Fin"]==null?'':json["Fin"],
    fecha:json["fecha"]==null?'': json["fecha"],
    distancia: json["distancia"]==null?'':json["distancia"],
    tiempo: json["tiempo"]==null?'':json["tiempo"],
    puntos: json["puntos"]==null?'':json["puntos"],
    opcion: ParseModel.parseToString(json["opcion"]),
  );

  Map<String, dynamic> toJson() => {
    "idDaiRutaPat": idDaiRutaPat,
    "Inicio": inicio,
    "Fin": fin,
    "fecha": fecha,
    "distancia": distancia,
    "tiempo": tiempo,
    "puntos": puntos,
    "opcion": opcion,
  };
}

part of 'models.dart';
DetalleDataClockModel detalleDataClockModelFromJson(String str) => DetalleDataClockModel.fromJson(json.decode(str));

String detalleDataClockModelToJson(DetalleDataClockModel data) => json.encode(data.toJson());

class DetalleDataClockModel {
  DataDetalleClock dataDetalleClock;

  DetalleDataClockModel({
    required this.dataDetalleClock,
  });

  factory DetalleDataClockModel.fromJson(Map<String, dynamic> json) => DetalleDataClockModel(
    dataDetalleClock: DataDetalleClock.fromJson(json["dataDetalleClock"]),
  );

  Map<String, dynamic> toJson() => {
    "dataDetalleClock": dataDetalleClock.toJson(),
  };
}

class DataDetalleClock {
  int codeError;
  String msj;
  List<DetalleClock> detalleClock;

  DataDetalleClock({
    required this.codeError,
    required this.msj,
    required this.detalleClock,
  });

  factory DataDetalleClock.fromJson(Map<String, dynamic> json) => DataDetalleClock(
    codeError: json["codeError"],
    msj: json["msj"],
    detalleClock: List<DetalleClock>.from(json["datos"].map((x) => DetalleClock.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "codeError": codeError,
    "msj": msj,
    "datos": List<dynamic>.from(detalleClock.map((x) => x.toJson())),
  };
}

class DetalleClock {
  String numero;
  String descModalidad;
  String descArma;
  String descSubCatLugar;
  String descripcion;
  String descDelito;
  String diaSemana;
  String horadelito;

  DetalleClock({
    required this.numero,
    required this.descModalidad,
    required this.descArma,
    required this.descSubCatLugar,
    required this.descripcion,
    required this.descDelito,
    required this.diaSemana,
    required this.horadelito,
  });

  factory DetalleClock.fromJson(Map<String, dynamic> json) => DetalleClock(
    numero: ParseModel.parseToString(json["numero"]),
    descModalidad: json["descModalidad"]==null?'':json["descModalidad"],
    descArma: json["descArma"]==null?'':json["descArma"],
    descSubCatLugar: json["descSubCatLugar"]==null?'':json["descSubCatLugar"],
    descripcion: json["descripcion"]==null?'':json["descripcion"],
    descDelito:json["descDelito"]==null?'': json["descDelito"],
    diaSemana: json["dia_semana"]==null?'':json["dia_semana"],
    horadelito:json["horadelito"]==null?'': json["horadelito"],
  );

  Map<String, dynamic> toJson() => {
    "numero": numero,
    "descModalidad": descModalidad,
    "descArma": descArma,
    "descSubCatLugar": descSubCatLugar,
    "descripcion": descripcion,
    "descDelito": descDelito,
    "dia_semana": diaSemana,
    "horadelito": horadelito,
  };
}

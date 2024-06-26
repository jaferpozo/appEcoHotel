part of 'models.dart';

DataClockModel dataClockModelFromJson(String str) => DataClockModel.fromJson(json.decode(str));

String dataClockModelToJson(DataClockModel data) => json.encode(data.toJson());

class DataClockModel {
  DataClockModel({
    required this.dataClock,
  });

  DataClock dataClock;

  factory DataClockModel.fromJson(Map<String, dynamic> json) => DataClockModel(
    dataClock: DataClock.fromJson(json["dataClock"]),
  );

  Map<String, dynamic> toJson() => {
    "dataClock": dataClock.toJson(),
  };
}

class DataClock {
  DataClock({
    required this.codeError,
    required this.msj,
    required this.clock,
  });

  int codeError;
  String msj;
  List<Clock> clock;

  factory DataClock.fromJson(Map<String, dynamic> json) => DataClock(
    codeError: json["codeError"],
    msj: json["msj"],
    clock: List<Clock>.from(json["datos"].map((x) => Clock.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "codeError": codeError,
    "msj": msj,
    "datos": List<dynamic>.from(clock.map((x) => x.toJson())),
  };
}

class Clock {
  Clock({
    required this.numero,
    required this.descModalidad,
    required this.descArma,
    required this.descSubCatLugar,
    required this.descripcion,
    required this.descDelito,
    required this.diaSemana,
    required this.horadelito,
  });

  String numero;
  String descModalidad;
  String descArma;
  String descSubCatLugar;
  String descripcion;
  String descDelito;
  String diaSemana;
  String horadelito;

  factory Clock.fromJson(Map<String, dynamic> json) => Clock(
    numero: ParseModel.parseToString(json["numero"]),
    descModalidad: json["descModalidad"]==null?'':json["descModalidad"],
    descArma: json["descArma"]==null?'':json["descArma"],
    descSubCatLugar: json["descSubCatLugar"]==null?'':json["descSubCatLugar"],
    descripcion: json["descripcion"]==null?'':json["descripcion"],
    descDelito: json["descDelito"]==null?'':json["descDelito"],
    diaSemana: ParseModel.parseToString(json["diaSemana"]),
    horadelito: json["horadelito"]==null?'':json["horadelito"],
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

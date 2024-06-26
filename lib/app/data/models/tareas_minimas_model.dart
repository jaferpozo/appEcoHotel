part of 'models.dart';

TareasMinimasModel tareasMinimasModelFromJson(String str) => TareasMinimasModel.fromJson(json.decode(str));

String tareasMinimasModelToJson(TareasMinimasModel data) => json.encode(data.toJson());

class TareasMinimasModel {
  TareasMinimasModel({
    required this.daiTareasMin,
  });

  DaiTareasMin daiTareasMin;

  factory TareasMinimasModel.fromJson(Map<String, dynamic> json) => TareasMinimasModel(
    daiTareasMin: DaiTareasMin.fromJson(json["daiTareasMin"]),
  );

  Map<String, dynamic> toJson() => {
    "daiTareasMin": daiTareasMin.toJson(),
  };
}

class DaiTareasMin {
  DaiTareasMin({
    required this.codeError,
    required this.msj,
    required this.tareas,
  });

  int codeError;
  String msj;
  List<Tarea> tareas;

  factory DaiTareasMin.fromJson(Map<String, dynamic> json) => DaiTareasMin(
    codeError: json["codeError"],
    msj: json["msj"],
    tareas: List<Tarea>.from(json["datos"].map((x) => Tarea.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "codeError": codeError,
    "msj": msj,
    "datos": List<dynamic>.from(tareas.map((x) => x.toJson())),
  };
}

class Tarea {
  Tarea({
    required this.idDaiTareasMin,
    required this.desctareas,
    required this.idGenEstado,
  });

  String idDaiTareasMin;
  String desctareas;
  String idGenEstado;

  factory Tarea.fromJson(Map<String, dynamic> json) => Tarea(
    idDaiTareasMin: ParseModel.parseToString(json["idDaiTareasMin"]),
    desctareas: json["desctareas"] == null ? '' : json["desctareas"],
  idGenEstado: ParseModel.parseToString(json["idDaiTareasMin"]),
  );

  Map<String, dynamic> toJson() => {
    "idDaiTareasMin": idDaiTareasMin,
    "desctareas": desctareas,
    "idGenEstado": idGenEstado,
  };
}

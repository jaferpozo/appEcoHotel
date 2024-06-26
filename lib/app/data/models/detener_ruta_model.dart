part of 'models.dart';
DetenerRutaModel detenerRutaModelFromJson(String str) => DetenerRutaModel.fromJson(json.decode(str));

String detenerRutaModelToJson(DetenerRutaModel data) => json.encode(data.toJson());

class DetenerRutaModel {
  DaiDetener daiDetener;

  DetenerRutaModel({
    required this.daiDetener,
  });

  factory DetenerRutaModel.fromJson(Map<String, dynamic> json) => DetenerRutaModel(
    daiDetener: DaiDetener.fromJson(json["daiDetener"]),
  );

  Map<String, dynamic> toJson() => {
    "daiDetener": daiDetener.toJson(),
  };
}

class DaiDetener {
  int codeError;
  String msj;
  List<Detener> detener;

  DaiDetener({
    required this.codeError,
    required this.msj,
    required this.detener,
  });

  factory DaiDetener.fromJson(Map<String, dynamic> json) => DaiDetener(
    codeError: json["codeError"],
    msj: json["msj"],
    detener: List<Detener>.from(json["datos"].map((x) => Detener.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "codeError": codeError,
    "msj": msj,
    "datos": List<dynamic>.from(detener.map((x) => x.toJson())),
  };
}

class Detener {
  String id;

  Detener({
    required this.id,
  });

  factory Detener.fromJson(Map<String, dynamic> json) => Detener(
    id: ParseModel.parseToString(json["id"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
  };
}

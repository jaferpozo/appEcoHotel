part of 'models.dart';

PoligonoModel poligonoModelFromJson(String str) => PoligonoModel.fromJson(json.decode(str));

String poligonoModelToJson(PoligonoModel data) => json.encode(data.toJson());

class PoligonoModel {
  DaiPuntos daiPuntos;

  PoligonoModel({
    required this.daiPuntos,
  });

  factory PoligonoModel.fromJson(Map<String, dynamic> json) => PoligonoModel(
    daiPuntos: DaiPuntos.fromJson(json["daiPuntos"]),
  );

  Map<String, dynamic> toJson() => {
    "daiPuntos": daiPuntos.toJson(),
  };
}

class DaiPuntos {
  int codeError;
  String msj;
  List<Punto> puntos;

  DaiPuntos({
    required this.codeError,
    required this.msj,
    required this.puntos,
  });

  factory DaiPuntos.fromJson(Map<String, dynamic> json) => DaiPuntos(
    codeError: json["codeError"],
    msj: json["msj"],
    puntos: List<Punto>.from(json["datos"].map((x) => Punto.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "codeError": codeError,
    "msj": msj,
    "datos": List<dynamic>.from(puntos.map((x) => x.toJson())),
  };
}

class Punto {
  double lat;
  double lon;

  Punto({
    required this.lat,
    required this.lon,
  });

  factory Punto.fromJson(Map<String, dynamic> json) => Punto(
    lat:ParseModel.parseToDouble(json["lat"]),
    lon: ParseModel.parseToDouble(json["lon"]),
  );

  Map<String, dynamic> toJson() => {
    "lat": lat,
    "lon": lon,
  };
}

part of 'models.dart';

CoordenadasModel coordenadasModelFromJson(String str) => CoordenadasModel.fromJson(json.decode(str));

String coordenadasModelToJson(CoordenadasModel data) => json.encode(data.toJson());

class CoordenadasModel {
  List<Coordenada> coordenadas;

  CoordenadasModel({
    required this.coordenadas,
  });

  factory CoordenadasModel.fromJson(Map<String, dynamic> json) => CoordenadasModel(
    coordenadas: List<Coordenada>.from(json["coordenadas"].map((x) => Coordenada.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "coordenadas": List<dynamic>.from(coordenadas.map((x) => x.toJson())),
  };
}

class Coordenada {
  double lat;
  double long;

  Coordenada({
    required this.lat,
    required this.long,
  });

  factory Coordenada.fromJson(Map<String, dynamic> json) => Coordenada(
    lat: json["lat"],
    long: json["long"],
  );

  Map<String, dynamic> toJson() => {
    "lat": lat,
    "long": long,
  };
}

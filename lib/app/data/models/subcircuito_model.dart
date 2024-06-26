part of 'models.dart';
SubcircuitoModel subcircuitoModelFromJson(String str) => SubcircuitoModel.fromJson(json.decode(str));

String subcircuitoModelToJson(SubcircuitoModel data) => json.encode(data.toJson());

class SubcircuitoModel {
  SubcircuitoModel({
    required this.genGeoSenplades,
  });

  GenGeoSenplades genGeoSenplades;

  factory SubcircuitoModel.fromJson(Map<String, dynamic> json) => SubcircuitoModel(
    genGeoSenplades: GenGeoSenplades.fromJson(json["genGeoSenplades"]),
  );

  Map<String, dynamic> toJson() => {
    "genGeoSenplades": genGeoSenplades.toJson(),
  };
}

class GenGeoSenplades {
  GenGeoSenplades({
    required this.codeError,
    required this.msj,
    required this.subcir,
  });

  int codeError;
  String msj;
  List<Subcir> subcir;

  factory GenGeoSenplades.fromJson(Map<String, dynamic> json) => GenGeoSenplades(
    codeError: json["codeError"],
    msj: json["msj"],
    subcir: List<Subcir>.from(json["datos"].map((x) => Subcir.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "codeError": codeError,
    "msj": msj,
    "datos": List<dynamic>.from(subcir.map((x) => x.toJson())),
  };
}

class Subcir {
  Subcir({
    required this.idGenGeoSenplades,
    required this.descripcion,
    required this.siglasGeoSenplades,
    required this.codigoSenplades,
  });

  String idGenGeoSenplades;
  String descripcion;
  String siglasGeoSenplades;
  String codigoSenplades;

  factory Subcir.fromJson(Map<String, dynamic> json) => Subcir(

  idGenGeoSenplades: ParseModel.parseToString(json["idGenGeoSenplades"]),
    descripcion: json["descripcion"] == null ? '' : json["descripcion"],
    siglasGeoSenplades: json["siglasGeoSenplades"] == null ? '' : json["siglasGeoSenplades"],
    codigoSenplades: ParseModel.parseToString(json["codigoSenplades"]),
  );

  Map<String, dynamic> toJson() => {
    "idGenGeoSenplades": idGenGeoSenplades,
    "descripcion": descripcion,
    "siglasGeoSenplades": siglasGeoSenplades,
    "codigoSenplades": codigoSenplades,
  };
}

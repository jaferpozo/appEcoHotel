part of 'models.dart';
ListaPuntosModel listaPuntosModelFromJson(String str) => ListaPuntosModel.fromJson(json.decode(str));
String listaPuntosModelToJson(ListaPuntosModel data) => json.encode(data.toJson());

class ListaPuntosModel {
  ListaPuntosModel({
    required this.upcBienes,
  });

  UpcBienes upcBienes;

  factory ListaPuntosModel.fromJson(Map<String, dynamic> json) => ListaPuntosModel(
    upcBienes: UpcBienes.fromJson(json["upcBienes"]),
  );

  Map<String, dynamic> toJson() => {
    "upcBienes": upcBienes.toJson(),
  };
}

class UpcBienes {
  UpcBienes({
    required this.codeError,
    required this.msj,
    required this.listaPunto,
  });

  int codeError;
  String msj;
  List<ListaPunto> listaPunto;

  factory UpcBienes.fromJson(Map<String, dynamic> json) => UpcBienes(
    codeError: json["codeError"],
    msj: json["msj"],
    listaPunto: List<ListaPunto>.from(json["datos"].map((x) => ListaPunto.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "codeError": codeError,
    "msj": msj,
    "datos": List<dynamic>.from(listaPunto.map((x) => x.toJson())),
  };
}

class ListaPunto {
  ListaPunto({
    required this.idDaiConfBienes,
    required this.idUpcTipoBien,
    required this.tbDescripcion,
  });

  String idDaiConfBienes;
  String idUpcTipoBien;
  String tbDescripcion;

  factory ListaPunto.fromJson(Map<String, dynamic> json) => ListaPunto(
    idDaiConfBienes: ParseModel.parseToString(json["idDaiConfBienes"]),
    idUpcTipoBien: ParseModel.parseToString(json["idUpcTipoBien"]),
    tbDescripcion: json["tbDescripcion"]==null?'':json["tbDescripcion"],
  );

  Map<String, dynamic> toJson() => {
    "idDaiConfBienes": idDaiConfBienes,
    "idUpcTipoBien": idUpcTipoBien,
    "tbDescripcion": tbDescripcion,
  };
}

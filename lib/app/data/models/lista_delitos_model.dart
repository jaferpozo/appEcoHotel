part of 'models.dart';
ListaModel listaModelFromJson(String str) => ListaModel.fromJson(json.decode(str));

String listaModelToJson(ListaModel data) => json.encode(data.toJson());

class ListaModel {
  ListaModel({
    required this.daiDelCom,
  });

  DaiDelCom daiDelCom;

  factory ListaModel.fromJson(Map<String, dynamic> json) => ListaModel(
    daiDelCom: DaiDelCom.fromJson(json["daiDelCom"]),
  );

  Map<String, dynamic> toJson() => {
    "daiDelCom": daiDelCom.toJson(),
  };
}

class DaiDelCom {
  DaiDelCom({
    required this.codeError,
    required this.msj,
    required this.listaDelito,
  });

  int codeError;
  String msj;
  List<ListaDelito> listaDelito;

  factory DaiDelCom.fromJson(Map<String, dynamic> json) => DaiDelCom(
    codeError: json["codeError"],
    msj: json["msj"],
    listaDelito: List<ListaDelito>.from(json["datos"].map((x) => ListaDelito.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "codeError": codeError,
    "msj": msj,
    "datos": List<dynamic>.from(listaDelito.map((x) => x.toJson())),
  };
}

class ListaDelito {
  ListaDelito({
    required this.idDaiDelito,
    required this.descDelito,
    required this.imgDelito,
  });

  String idDaiDelito;
  String descDelito;
  String imgDelito;

  factory ListaDelito.fromJson(Map<String, dynamic> json) => ListaDelito(
    idDaiDelito: ParseModel.parseToString(json["idDaiDelito"]),
    descDelito: json["descDelito"] == null ? '' : json["descDelito"],
    imgDelito: json["imgDelito"] == null ? '' : json["imgDelito"],
  );

  Map<String, dynamic> toJson() => {
    "idDaiDelito": idDaiDelito,
    "descDelito": descDelito,
    "imgDelito": imgDelito,
  };
}

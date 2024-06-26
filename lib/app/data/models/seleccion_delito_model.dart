part of 'models.dart';

SeleccionDelitoModel seleccionDelitoModelFromJson(String str) =>
    SeleccionDelitoModel.fromJson(json.decode(str));

String seleccionDelitoModelToJson(SeleccionDelitoModel data) =>
    json.encode(data.toJson());

class SeleccionDelitoModel {
  SeleccionDelitoModel({
    required this.daiDelito,
  });

  DaiDelito daiDelito;

  factory SeleccionDelitoModel.fromJson(Map<String, dynamic> json) =>
      SeleccionDelitoModel(
        daiDelito: DaiDelito.fromJson(json["daiDelito"]),
      );

  Map<String, dynamic> toJson() => {
        "daiDelito": daiDelito.toJson(),
      };
}

class DaiDelito {
  DaiDelito({
    required this.codeError,
    required this.msj,
    required this.delito,
  });

  int codeError;
  String msj;
  List<Delito> delito;

  factory DaiDelito.fromJson(Map<String, dynamic> json) => DaiDelito(
        codeError: json["codeError"],
        msj: json["msj"],
        delito: List<Delito>.from(json["datos"].map((x) => Delito.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "codeError": codeError,
        "msj": msj,
        "datos": List<dynamic>.from(delito.map((x) => x.toJson())),
      };
}

class Delito {
  Delito({
    required this.idDaiDelCom,
    required this.idGenGeoSenplades,
    required this.idDaiDelito,
    required this.descDelito,
    required this.objetoRobado,
    //  required this.descModalidad,
    required this.latitudDelito,
    required this.longitudDelito,
    required this.descripcion,
    required this.fechaDelito,
    required this.codigoSenplades,
    required this.imgDelito,
  });

  String idDaiDelCom;
  String idGenGeoSenplades;
  String idDaiDelito;
  String descDelito;
  String objetoRobado;
  //String descModalidad;
  String latitudDelito;
  String longitudDelito;
  String descripcion;
  String fechaDelito;
  String codigoSenplades;

  String imgDelito;

  factory Delito.fromJson(Map<String, dynamic> json) => Delito(
        idDaiDelCom: ParseModel.parseToString(json["idDaiDelCom"]),
        idGenGeoSenplades: ParseModel.parseToString(json["idGenGeoSenplades"]),
        idDaiDelito: ParseModel.parseToString(json["idDaiDelito"]),
        descDelito: json["descDelito"] == null ? '' : json["descDelito"],
        objetoRobado: json["objetoRobado"] == null ? '' : json["objetoRobado"],
        //  descModalidad: json["descModalidad"] == null ? '' : json["descModalidad"],
        latitudDelito:  json["latitudDelito"] == null ? '0.0' : json["latitudDelito"],
        longitudDelito: json["longitudDelito"] == null ? '0.0' : json["longitudDelito"],
        descripcion: json["descripcion"] == null ? '' : json["descripcion"],
        fechaDelito: json["fechaDelito"] == null ? '' : json["fechaDelito"],
        codigoSenplades: ParseModel.parseToString(json["codigoSenplades"]),
        imgDelito: json["imgDelito"] == null ? '' : json["imgDelito"],
      );

  Map<String, dynamic> toJson() => {
        "idDaiDelCom": idDaiDelCom,
        "idGenGeoSenplades": idGenGeoSenplades,
        "idDaiDelito": idDaiDelito,
        "descDelito": descDelito,
        "objetoRobado": objetoRobado,
        // "descModalidad": descModalidad,
        "latitudDelito": latitudDelito,
        "longitudDelito": longitudDelito,
        "descripcion": descripcion,
        "fechaDelito": fechaDelito,
        "codigoSenplades": codigoSenplades,

        "imgDelito": imgDelito,
      };
}

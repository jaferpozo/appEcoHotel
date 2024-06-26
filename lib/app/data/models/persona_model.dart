part of 'models.dart';
// To parse this JSON data, do
//
//     final personaModel = personaModelFromJson(jsonString);
PersonaModel personaModelFromJson(String str) => PersonaModel.fromJson(json.decode(str));

String personaModelToJson(PersonaModel data) => json.encode(data.toJson());

class PersonaModel {
  PersonaModel({
    required this.persona,
  });

  Persona persona;

  factory PersonaModel.fromJson(Map<String, dynamic> json) => PersonaModel(
    persona: Persona.fromJson(json["Persona"]),
  );

  Map<String, dynamic> toJson() => {
    "Persona": persona.toJson(),
  };
}

class Persona {
  Persona({
    required this.codeError,
    required this.msj,
    required this.datosPersona,
  });

  int codeError;
  String msj;
  DatosPersona datosPersona;

  factory Persona.fromJson(Map<String, dynamic> json) => Persona(
    codeError: json["codeError"],
    msj: json["msj"],

    datosPersona:  json["msj"]=="existe"?
    DatosPersona.fromJson(json["datos"]) :
    DatosPersona(idGenPersona: 0, apenom: '', descGrado: '', idDgpGrado: '', policia: '', documento: '',
      unidad: '', idDgpUnidad: '', seccion: '', departamento: '', direccion: '', foto: ''),
  );

  Map<String, dynamic> toJson() => {
    "codeError": codeError,
    "msj": msj,
    "datos": datosPersona.toJson(),
  };
}

class DatosPersona {
  DatosPersona({
    required this.idGenPersona,
    required this.apenom,
    required this.descGrado,
    required this.idDgpGrado,
    required this.policia,
    required this.documento,
    required this.unidad,
    required this.idDgpUnidad,
    required this.seccion,
    required this.departamento,
    required this.direccion,
    required this.foto,
  });

  int idGenPersona;
  String apenom;
  String descGrado;
  String idDgpGrado;
  String policia;
  String documento;
  String unidad;
  String idDgpUnidad;
  String seccion;
  String departamento;
  String direccion;
  String foto;

  factory DatosPersona.fromJson(Map<String, dynamic> json) => DatosPersona(
    idGenPersona:ParseModel.parseToInt( json["idGenPersona"]),
    apenom: json["apenom"] == null ? null : json["apenom"],
    descGrado: json["descGrado"] == null ? null : json["descGrado"],
    idDgpGrado: ParseModel.parseToString(json["idDgpGrado"]),
    policia: json["policia"] == null ? null : json["policia"],
    documento: json["documento"] == null ? null : json["documento"],
    unidad: json["unidad"] == null ? null : json["unidad"],
    idDgpUnidad: ParseModel.parseToString(json["idDgpUnidad"]),
    seccion: json["seccion"] == null ? '' : json["seccion"],
    departamento: json["departamento"] == null ? '' : json["departamento"],
    direccion: json["direccion"] == null ? '' : json["direccion"],
    foto: json["foto"] == null ? '' : json["foto"],
  );

  Map<String, dynamic> toJson() => {
    "idGenPersona": idGenPersona,
    "apenom": apenom,
    "descGrado": descGrado,
    "idDgpGrado": idDgpGrado,
    "policia": policia,
    "documento": documento,
    "unidad": unidad,
    "idDgpUnidad": idDgpUnidad,
    "seccion": seccion,
    "departamento": departamento,
    "direccion": direccion,
    "foto": foto,
  };
}
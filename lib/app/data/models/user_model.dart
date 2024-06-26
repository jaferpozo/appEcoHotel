part of 'models.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));
String userModelToJson(UserModel data) => json.encode(data.toJson());
class UserModel {
  UserModel({
    required this.usuario,
  });
  Usuario usuario;
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    usuario: Usuario.fromJson(json["usuario"]),
  );
  factory UserModel.empty()=>UserModel(usuario:Usuario(codeError: 0,msj: '',datos: [User(idGenUsuario: '',
      idGenPersona: '', nombreUsuario: '', unidad: '',direccion: '',descGrado: '',apenom: '', documento: '', sexoPerson: '',idDgpGrado: '',
      actualizarApp: false, foto: '', session: false, motivo: '')]) );

  Map<String, dynamic> toJson() => {
    "usuario": usuario.toJson(),
  };
}

class Usuario {
  Usuario({
    required this.codeError,
    required this.msj,
    required this.datos,
  });

  int codeError;
  String msj;
  List<User> datos;

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
    codeError: json["codeError"],
    msj: json["msj"],
    datos: List<User>.from(json["datos"].map((x) => User.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "codeError": codeError,
    "msj": msj,
    "datos": List<dynamic>.from(datos.map((x) => x.toJson())),
  };
}

class User {
  User({
    required this.idGenUsuario,
    required this.idGenPersona,
    required this.nombreUsuario,
    required this.descGrado,
    required this.direccion,
    required this.unidad,
    required this.apenom,
    required this.documento,
    required this.sexoPerson,
    required this.idDgpGrado,
    required this.actualizarApp,
    required this.foto,
    required this.session,
    required this.motivo,
  });

  String idGenUsuario;
  String idGenPersona;
  String nombreUsuario;
  String descGrado;
  String direccion;
  String unidad;
  String apenom;
  String documento;
  String sexoPerson;
  String idDgpGrado;
  bool actualizarApp;
  String foto;
  bool session;
  String motivo;

  factory User.empty()=>User(idGenUsuario: '',
      idGenPersona: '', nombreUsuario: '', descGrado: '',direccion: '',unidad: '',apenom: '', documento: '', sexoPerson: '',idDgpGrado: '',
      actualizarApp: false, foto: '', session: false, motivo: '');

  factory User.fromJson(Map<String, dynamic> json) => User(
    idGenUsuario: ParseModel.parseToString(json["idGenUsuario"]),
    idGenPersona: ParseModel.parseToString(json["idGenPersona"]),
    nombreUsuario: json["nombreUsuario"] == null ? '' : json["nombreUsuario"],
    descGrado: json["descGrado"] == null ? '' : json["descGrado"],
    direccion: json["direccion"] == null ? '' : json["direccion"],
    unidad: json["unidad"] == null ? '' : json["unidad"],
    apenom: json["apenom"] == null ? '' : json["apenom"],
    documento: json["documento"] == null ? '' : json["documento"],
    sexoPerson: json["sexoPerson"] == null ? '' : json["sexoPerson"],
    idDgpGrado: ParseModel.parseToString(json["idDgpGrado"]),
    actualizarApp: json["actualizarApp"] == null ? '' : json["actualizarApp"],
    foto: json["foto"] == null ? '' : json["foto"],
    session: json["session"] == null ? '' : json["session"],
    motivo: json["motivo"] == null ? '' : json["motivo"],
  );

  Map<String, dynamic> toJson() => {
    "idGenUsuario": idGenUsuario,
    "idGenPersona": idGenPersona,
    "nombreUsuario": nombreUsuario,
    "descGrado":descGrado,
    "apenom": apenom,
    "documento": documento,
    "direccion": direccion,
    "unidad": unidad,
    "sexoPerson": sexoPerson,
    "idDgpGrado": idDgpGrado,
    "actualizarApp": actualizarApp,
    "foto": foto,
    "session": session,
    "motivo": motivo,
  };
}

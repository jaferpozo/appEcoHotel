part of '../controllers.dart';

class MenuPrincipalController extends GetxController {
  RxBool peticionServerState = false.obs;
  late StreamSubscription connectionSubscription;
  final status = Rx<ConnectionStatus>(ConnectionStatus.online);
  final GpsController gpsController = Get.find<GpsController>();
  RxList<String> listaModulo = <String>[].obs;

  String general1 = "", general2 = "", imagen = "";
  String n1 = "", n2 = "", n3 = "", n4 = "", n5 = "", n6 = "", n7 = "", n8 = "";

  //variable para que solo carge una vez los datos
  String nombre = '';
  String cedula = '';
  String direc = "";
  String fecha = "";
  String estadoConex = "";
  String acuerdo = "";

  List<HabitacionModel> habitaciones = [
    HabitacionModel(
        precio: 15,
        titulo: "Habitacion 1",
        detalle: "Descripcion",
        puntuacion: 4,
        visitas: 35,
        img: AppImages.imgH1),

    HabitacionModel(
        precio: 25,
        titulo: "Habitacion 2",
        detalle: "Descripcion",
        puntuacion: 4.3,
        visitas: 40,
        img: AppImages.imgH2),

    HabitacionModel(
        precio: 30,
        titulo: "Habitacion 3",
        detalle: "Descripcion",
        puntuacion: 4.5,
        visitas: 20,
        img: AppImages.imgH3),

    HabitacionModel(
        precio: 40,
        titulo: "Habitacion 4",
        detalle: "Descripcion",
        puntuacion: 5,
        visitas: 28,
        img: AppImages.imgH4),
  ];

  RxString userPref = ''.obs;

  @override
  void onInit() {
    verificaTConexion();
    _verificaDatos();
    // TODO: el contolloler se ha creado pero la vista no se ha renderizado
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: Donde la vista ya se presento
    _init();
  }

  _init() async {
    print(Get.deviceLocale.toString());
  }

  final LocalStoreImpl _localStoreImpl = Get.find<LocalStoreImpl>();

  _verificaDatos() async {
    print("SPLASH: verificando datos");
    //userPref.value = await _localStoreImpl.getDatosUsuario();
    //acuerdo = await _localStoreImpl.getDatosAcuerdo();
  }

  verificarGps() async {
    //se verifica si el GPS del dispositivo seta activo y tiene permisos
    bool verificarGps = await gpsController.verificarGPS();
    if (verificarGps) {
      gpsController.iniciarSeguimiento();
      // iniciarSeguimiento1();
      if (AppConfig.ubicacion.value.latitude == 0.0) {
        DialogosAwesome.getInformation(
            descripcion: "Las coordenas aun no estan lista vuelva a intentar");
      } else {
        gpsController.cancelarSeguimiento();
        Get.toNamed(AppRoutes.MAPAUPC);
      }
    }
  }

  connectionStatusController() {
    connectionSubscription = internetChecker
        .internetStatus()
        .listen((newStatus) => status.value = newStatus);
    if (status.value == ConnectionStatus.online) {
      verificaTConexion();
    }
  }

  verificaTConexion() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        estadoConex = 'S';
        print('connected');
        cargarDatosLista();
      }
    } on SocketException catch (_) {
      estadoConex = 'N';
    }
  }

  cargarDatosLista() async {
    try {
      listaModulo.clear();
      peticionServerState(true);

      peticionServerState(false);
    } on ServerException catch (e) {
      peticionServerState(false);
      DialogosAwesome.getError(descripcion: e.cause);
    }
  }
}

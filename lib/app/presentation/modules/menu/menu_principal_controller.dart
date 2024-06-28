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

  List<bool> select=[true,false,false];

   RxList<HabitacionModel> habitaciones = [
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
  ].obs;

  List<HabitacionModel> habitaciones1 = [
    HabitacionModel(
        precio: 15,
        titulo: "Habitacion 10",
        detalle: "Descripcion",
        puntuacion: 4,
        visitas: 35,
        img: AppImages.imgH1),

    HabitacionModel(
        precio: 25,
        titulo: "Habitacion 11",
        detalle: "Descripcion",
        puntuacion: 4.3,
        visitas: 40,
        img: AppImages.imgH2),

    HabitacionModel(
        precio: 30,
        titulo: "Habitacion 12",
        detalle: "Descripcion",
        puntuacion: 4.5,
        visitas: 20,
        img: AppImages.imgH3),

    HabitacionModel(
        precio: 40,
        titulo: "Habitacion 13",
        detalle: "Descripcion",
        puntuacion: 5,
        visitas: 28,
        img: AppImages.imgH4),
  ];

  List<HabitacionModel> habitaciones2 = [
    HabitacionModel(
        precio: 15,
        titulo: "a 23",
        detalle: "Descripcion",
        puntuacion: 4,
        visitas: 35,
        img: AppImages.imgH1),

    HabitacionModel(
        precio: 25,
        titulo: "a 21",
        detalle: "Descripcion",
        puntuacion: 4.3,
        visitas: 40,
        img: AppImages.imgH2),

    HabitacionModel(
        precio: 30,
        titulo: "aa 23",
        detalle: "Descripcion",
        puntuacion: 4.5,
        visitas: 20,
        img: AppImages.imgH3),

    HabitacionModel(
        precio: 40,
        titulo: "aaaa 4",
        detalle: "Descripcion",
        puntuacion: 5,
        visitas: 28,
        img: AppImages.imgH4),
  ];


  List<HabitacionModel> habitaciones3 = [
    HabitacionModel(
        precio: 15,
        titulo: "ttt 1",
        detalle: "Descripcion",
        puntuacion: 4,
        visitas: 35,
        img: AppImages.imgH1),

    HabitacionModel(
        precio: 25,
        titulo: "ttt 2",
        detalle: "Descripcion",
        puntuacion: 4.3,
        visitas: 40,
        img: AppImages.imgH2),

    HabitacionModel(
        precio: 30,
        titulo: "tttt 3",
        detalle: "Descripcion",
        puntuacion: 4.5,
        visitas: 20,
        img: AppImages.imgH3),

    HabitacionModel(
        precio: 40,
        titulo: "tttt 4",
        detalle: "Descripcion",
        puntuacion: 5,
        visitas: 28,
        img: AppImages.imgH4),
  ];

  RxString userPref = ''.obs;

  @override
  void onInit() {

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




setHabitacion( List<HabitacionModel> habitacion){
  habitaciones.value=habitacion;

}



}

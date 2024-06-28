part of '../controllers.dart';

class DetalleHabitacionController extends GetxController {
  RxBool peticionServerState = false.obs;
  HabitacionModel habitacionModel = HabitacionModel(
      precio: 0,
      titulo: "",
      detalle: "",
      puntuacion: 0,
      visitas: 0,
      img: AppImages.imgH1);

  @override
  void onInit() {
    // TODO: el contolloler se ha creado pero la vista no se ha renderizado
    getData();
    super.onInit();

  }

  @override
  void onReady() {
    // TODO: Donde la vista ya se presento

  }



  final LocalStoreImpl _localStoreImpl = Get.find<LocalStoreImpl>();

  getData(){
    print("data");

    var data = Get.arguments;
    if (data != null) {
      habitacionModel= data['data'];
    }
    print(data);
  }

  reservar(){

    DialogosDesingWidget.getDialogoX(contenido: PagoConTarjetaPage());

  }
}

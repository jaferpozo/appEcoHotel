part of '../pages.dart';

class DetalleHabitacionPage extends GetView<DetalleHabitacionController> {
  const DetalleHabitacionPage({super.key});

  @override
  Widget build(BuildContext context) {

    return WorkAreaMenuPageWidget(
        btnAtras: true,


        pantallaIrAtras: () => Get.back(),
        peticionServer: controller.peticionServerState,
        contenido: DetalleHabitacion(
          habitacionModel: controller.habitacionModel,
          onPressed: () => controller.reservar(),
        ));
  }
}

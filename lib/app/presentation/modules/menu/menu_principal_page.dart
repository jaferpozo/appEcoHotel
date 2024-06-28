part of '../pages.dart';

class MenuPrincipalPage extends GetView<MenuPrincipalController> {
  const MenuPrincipalPage({super.key});

  @override
  Widget build(BuildContext context) {


    return WorkAreaMenuPageWidget(
      btnAtras: true,
      pantallaIrAtras: () => Get.back(),
      peticionServer: controller.peticionServerState,
      contenido: Desing(habitaciones: controller.habitaciones,)
    );
  }



}

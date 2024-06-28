part of '../pages.dart';

class MenuPrincipalPage extends GetView<MenuPrincipalController> {
  const MenuPrincipalPage({super.key});

  @override
  Widget build(BuildContext context) {


    return WorkAreaMenuPageWidget(
      btnAtras: true,
      pantallaIrAtras: () => Get.back(),
      peticionServer: controller.peticionServerState,
      contenido: Obx(()=>Desing(
        select: controller.select,

        habitaciones: controller.habitaciones.value,
        onTap1: (){
          controller.select=[true,false,false];
          controller.setHabitacion(controller.habitaciones1);
        },
        onTap2: (){
          controller.select=[false,true,false];
          controller.setHabitacion(controller.habitaciones2);
        },
        onTap3: (){
          controller.select=[false,false,true];
          controller.setHabitacion(controller.habitaciones3);
        },

      ))
    );
  }



}

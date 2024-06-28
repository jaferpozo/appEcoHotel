part of '../bindings.dart';

class DetalleHabitacionBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => DetalleHabitacionController(), fenix: true);

  }

}
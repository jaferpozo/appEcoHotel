part of '../bindings.dart';

class PagoBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => PagoController(), fenix: true);

  }

}
part of '../pages.dart';

class LoginPage extends GetView<LoginController> {
  final _formKey = GlobalKey<FormState>();
  var controllerUser = new TextEditingController();
  var controllerPass = new TextEditingController();

  void login({bool validarForm = true}) async {
    var isValid = true;
    if (validarForm) {
      isValid = _formKey.currentState!.validate();
    }
    if (isValid) {
      await controller.login();
    }
  }

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtil();
    Widget wg = Obx(() => WorkAreaLoginPageWidget(
          btnAtras: Platform.isIOS ? true : false,
          pantallaIrAtras: () {
            Get.offAllNamed(AppRoutes.SPLASH);
          },
          mostrarVersion: true,
          peticionServer: controller.peticionServerState,
          title: '',
          sizeTittle: 7,
          contenido: <Widget>[
            Column(
              children: <Widget>[
                controller.wgLoginUserPass.value
                    ? WgLogin(
                        onPressed: () => login(),
                        controllerPass: controller.controllerPass,
                        controllerUser: controller.controllerUser,
                        formKey: _formKey,
                      )
                    : Container(),
                SizedBox(
                  height: responsive.altoP(6),
                ),
              ],
            ),


  ],
        ));

    return GetBuilder<LoginController>(
      builder: (_c) => wg,
    );
  }
}





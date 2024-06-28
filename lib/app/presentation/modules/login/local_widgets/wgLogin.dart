import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/app_config.dart';
import '../../../../core/utils/responsiveUtil.dart';
import '../../../../core/values/app_images.dart';
import '../../../../core/values/app_strings.dart';
import '../../../routes/app_routes.dart';
import '../../../widgets/custom_widgets.dart';
import '../../controllers.dart';

class WgLogin extends StatefulWidget {
  final controllerUser;

  final controllerPass;

  final VoidCallback? onPressed;
  final formKey;
  final double ancho;
  final bool mostrarFondo;

  const WgLogin(
      {Key? key,
      this.controllerUser,
      this.controllerPass,
      this.onPressed,
      this.formKey,
      this.ancho = 50.0,
      this.mostrarFondo = false})
      : super(key: key);

  @override
  _WgLoginState createState() => _WgLoginState();
}

class _WgLoginState extends State<WgLogin> {
  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtil();
    final sizeTxt = responsive.anchoP(AppConfig.tamTexto + 2.0);

    Widget desing = Column(
      children: <Widget>[
        SizedBox(height: 220),
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: responsive.ancho! - widget.ancho,
            minWidth: responsive.ancho! - widget.ancho,
          ),
          child: Form(
              key: widget.formKey,
              child: Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white, //PARA PROBAR CONTAINER
                      borderRadius: new BorderRadius.circular(15.0),
                    ),
                    child: ImputTextWidget(
                      imgString: AppImages.iconIdentificacion,
                      controller: widget.controllerUser,
                      elevation: 1,
                      label: "Usuario",
                      fonSize: sizeTxt,
                      hitText: "Ingrese el usuario",
                      validar: (text) {
                        if (text!.length >= 3) {
                          return null;
                        }
                        return "Usuario no válido";
                      },
                    ),
                  ),
                  SizedBox(
                    height: responsive.altoP(2),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white, //PARA PROBAR CONTAINER
                      borderRadius: new BorderRadius.circular(15.0),
                    ),
                    child: ImputTextWidget(
                      imgString: AppImages.icon_clave,
                      elevation: 1,
                      isSegura: true,
                      controller: widget.controllerPass,
                      hitText: "Ingrese la Clave",
                      label: "Clave",
                      fonSize: sizeTxt,
                      validar: (text) {
                        if (text.toString().length >= 3) {
                          return null;
                        }
                        return "Clave no válida";
                      },
                    ),
                  )
                ],
              )),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {
              // Implementar acción de "Forgot Password"
            },
            child: Text('Olvido su Contraseña..?',style: TextStyle(color: Colors.white),),
          ),
        ),
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: responsive.ancho! - 10,
            minWidth: responsive.ancho! - 60,
          ),
          child: BotonesWidget(
            iconData: Icons.arrow_forward,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            title: "INGRESAR",
            onPressed: widget.onPressed,
          ),
        ),
        const SizedBox(height: 3),
        const Row(
          children: <Widget>[
            Expanded(child: Divider()),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text('O'),
            ),
            Expanded(child: Divider()),
          ],
        ),
        const SizedBox(height: 4),
        ElevatedButton.icon(
          onPressed: () {
            // Implementar acción de "Continue with Google"
          },
          icon: Icon(Icons.g_mobiledata),
          label: Text('Continuar con Google'),
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Colors.white,
            side: BorderSide(color: Colors.grey),
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 50),
          ),
        ),
        SizedBox(height: 4),
        ElevatedButton.icon(
          onPressed: () {
            // Implementar acción de "Continue with Facebook"
          },
          icon: Icon(Icons.facebook),
          label: Text('Continuar con Facebook'),
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Colors.white,
            side: BorderSide(color: Colors.grey),
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 45),
          ),
        ),
        SizedBox(height: 4),
        ElevatedButton.icon(
          onPressed: () {
            // Implementar acción de "Continue with Apple"
          },
          icon: Icon(Icons.apple),
          label: Text('Continuar con Apple'),
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Colors.white,
            side: BorderSide(color: Colors.grey),
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 55),
          ),
        ),
        SizedBox(height: 6),
        Center(
          child: TextButton(
            onPressed: () {
              Get.offAllNamed(AppRoutes.REGISTROUSUARIO);
            },
            child: Text(
              'No tienes una Cuenta? Registrate..!!',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );

    Widget wg = widget.mostrarFondo
        ? Stack(
            children: [

              Container(
                height: responsive.alto! / 2,
                width: responsive.ancho! - 100,
                child: Image.asset(
                  AppImages.imgarea,
                  fit: BoxFit.cover,
                ),
              ),
              desing,
            ],
          )
        : desing;

    return GetBuilder<LoginController>(
        id: 'WgLogin',
        builder: (_) => _.wgLoginUserPass.value ? wg : Container());
  }
}

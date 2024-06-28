import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:milicoreria/app/presentation/modules/pago/local_widgets/CreditCardForm.dart';
import 'package:url_launcher/url_launcher.dart';


import '../../../main.dart';
import '../../core/app_config.dart';
import '../../core/utils/check_internet_conexion.dart';
import '../../core/utils/responsiveUtil.dart';
import '../../core/utils/utilidadesUtil.dart';
import '../../core/values/app_images.dart';
import '../../core/values/app_strings.dart';
import '../routes/app_routes.dart';
import '../widgets/custom_widgets.dart';

import 'controllers.dart';
import 'detalle_habitacion/local_widgets/pago_tarjeta.dart';
import 'login/local_widgets/wgLogin.dart';
import 'login/local_widgets/workAreaLoginPageWidget.dart';
import 'menu/local_widgets/desing.dart';
import 'detalle_habitacion/local_widgets/detalle_habitacion.dart';


part 'splash/splash_page.dart';
part 'menu/menu_principal_page.dart';
part 'login/login_page.dart';
part 'registroUsuario/registro_usuario_page.dart';
part 'detalle_habitacion/detalle_habitacion_page.dart';
part 'pago/pago_page.dart';



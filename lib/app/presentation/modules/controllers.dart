import 'dart:async';
import 'dart:ffi';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:milicoreria/app/core/values/app_images.dart';
import 'package:milicoreria/app/data/models/models.dart';
import 'package:network_info_plus/network_info_plus.dart';

import '../../core/app_config.dart';
import '../../core/change_notifier/connection_status_change_notifier.dart';
import '../../core/exceptions/exceptions.dart';
import '../../core/utils/biometricUtil.dart';
import '../../core/utils/check_internet_conexion.dart';
import '../../core/utils/device_info.dart';
import '../../core/utils/encriptar_util.dart';
import '../../core/utils/my_date.dart';
import '../../core/utils/utilidadesUtil.dart';
import '../../data/repository/data_repositories.dart';
import '../gps/gps_impl_helper.dart';
import '../routes/app_routes.dart';
import '../widgets/custom_widgets.dart';
import 'package:geolocator/geolocator.dart' as myGeolocator;

import 'detalle_habitacion/local_widgets/pago_tarjeta.dart';


part 'splash/splash_controller.dart';
part 'menu/menu_principal_controller.dart';
part 'login/login_controller.dart';
part 'registroUsuario/registro_usuario_controller.dart';
part 'detalle_habitacion/detalle_habitacion_controller.dart';
part 'pago/pago_controller.dart';



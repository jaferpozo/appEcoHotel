
import 'dart:convert';
import 'dart:developer';
import 'dart:ffi';
import 'dart:typed_data';

//NECESARIOS PARA SUBIR ARCHIVOS
import 'package:async/async.dart'; //DelegatingStream
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:milicoreria/app/data/providers/remote/host/api_constantes.dart';
import 'package:path/path.dart';
import 'dart:io' as doc;


import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/app_config.dart';
import '../../core/exceptions/exception_helper.dart';
import '../../core/exceptions/exceptions.dart';
import '../../core/utils/photo_helper.dart';
import '../../core/utils/utilidadesUtil.dart';
import '../../domain/repositories/domain_repositories.dart';
import '../../presentation/widgets/custom_widgets.dart';
import '../models/models.dart';
import '../models/parse_model.dart';

part 'local/local_store_provider.dart';

part 'remote/host/url_api_provider.dart';
part 'remote/host/cabecera_json_model.dart';
part 'remote/host/host.dart';

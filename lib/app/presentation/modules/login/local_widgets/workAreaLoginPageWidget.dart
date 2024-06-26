import 'package:get/get.dart';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/app_config.dart';
import '../../../../core/utils/responsiveUtil.dart';
import '../../../../core/utils/utilidadesUtil.dart';
import '../../../../core/values/app_images.dart';
import '../../../../data/providers/providers_impl.dart';
import '../../../widgets/custom_widgets.dart';



class WorkAreaLoginPageWidget extends StatefulWidget {
  final RxBool peticionServer;
  final String title;
  final List<Widget> contenido;
  final bool btnAtras;
  final VoidCallback? pantallaIrAtras;
  final Widget? widgetBtnFinal;
  final EdgeInsetsGeometry? paddin;
  final FloatingActionButtonLocation ubicacionBtnFinal;
  final imgPerfil;
  final imgFondo;
  final double sizeTittle;
  final bool mostrarVersion;
  final bool eliminarSpaceTop;

  const WorkAreaLoginPageWidget({
    required this.peticionServer ,
    this.title = '',
    required this.contenido,
    this.btnAtras = false,
    this.widgetBtnFinal,
    this.paddin,
    this.ubicacionBtnFinal = FloatingActionButtonLocation.centerFloat,
    this.imgPerfil,
    this.imgFondo,
    this.sizeTittle = 0,
    this.mostrarVersion = false,
    this.pantallaIrAtras,
    this.eliminarSpaceTop = false,
  });

  @override
  _WorkAreaLoginPageWidgetState createState() => _WorkAreaLoginPageWidgetState();
}

class _WorkAreaLoginPageWidgetState extends State<WorkAreaLoginPageWidget> {
  String version = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadVersion();
  }

  _loadVersion() async {
    String _version = await UtilidadesUtil.getVersionCodeNameApp();
    setState(() {
      version = _version;
    });
  }

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtil();
    Widget wgImgFondo = Container(
      height: responsive.alto,
      width: responsive.ancho,
      child: Image.asset(
        widget.imgFondo ?? AppImages.imgarea,
        fit: BoxFit.cover,
      ),
    );


    Widget wgImgPerfil = Container(

      margin: EdgeInsets.only(
        top: responsive.altoP(8.0),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppConfig.radioBordecajas),
          boxShadow: [
            BoxShadow(color: Colors.blue.withOpacity(0.1), blurRadius: 45)
          ]),
      child: Center(
        child: Column(
          children: <Widget>[
            imgPerfilRedonda(
              size: 30,
              img: widget.imgPerfil,
            ),
            widget.title != ''
                ? Text(
              widget.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: widget.sizeTittle == 0
                      ? responsive.anchoP(9)
                      : responsive.anchoP(widget.sizeTittle)),
            )
                : Container(),
            const SizedBox(height: 5,),
            widget.mostrarVersion
                ? Text(
              'Versión 1: Build-' + version + ' ' + Host.getAmbiente(),
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white.withOpacity(0.5)),
            )
                : Container()
          ],
        ),
      ),
    );
    Widget wgBtnAtras = Container(
      width: responsive.ancho,
      height: responsive.isVertical()
          ? responsive.altoP(8.5)
          : responsive.altoP(20),
      child: Stack(
        children: [
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: Container(
              width: responsive.anchoP(38),
              height: responsive.anchoP(38),
            ),
          ),
          widget.btnAtras
              ? BtnAtrasWidget(
            pantallaIrAtras: widget.pantallaIrAtras,
          )
              : Container(),
        ],
      ),
    );
    return Scaffold(
        floatingActionButtonLocation: widget.ubicacionBtnFinal,
        floatingActionButton: widget.widgetBtnFinal,
        body: SafeArea(child: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Stack(
              children: [
                wgImgFondo,
                wgBtnAtras,
                Center(child:  SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 35),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment:
                      MainAxisAlignment.center,
                      children: <Widget>[
                        wgImgPerfil,

                        Column(
                          children:
                          widget.contenido ?? [Container()],
                        ),

                        SizedBox(height:responsive.altoP(5),),
                      ],
                    )),),
              Obx(()=>  CargandoWidget(
                mostrar: widget.peticionServer.value,
              ))
              ],
            )),));



  }
}



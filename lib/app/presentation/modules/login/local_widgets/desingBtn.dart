


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../widgets/custom_widgets.dart';

class DesingBtn extends StatelessWidget {
  final String? title;
  final String? img;
  final double ancho;
  final GestureTapCallback? onTap;


  const DesingBtn({Key? key, this.title, this.img, this.ancho=60.0, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BtnMenuWidget(

      img: img,
      title: this.title,
      horizontal: false,
      onTap: this.onTap,
      colorFondo: Colors.black38,
      colorTexto: Colors.white, titlte: '',
    );;
  }


}

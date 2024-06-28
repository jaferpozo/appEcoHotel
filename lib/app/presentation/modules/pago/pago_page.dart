part of '../pages.dart';

class PagoPage extends GetView<PagoController> {
  const PagoPage({super.key});

  @override
  Widget build(BuildContext context) {

    return WorkAreaMenuPageWidget(
        btnAtras: true,


        pantallaIrAtras: () => Get.back(),
        peticionServer: controller.peticionServerState,
        contenido: getContenido());
  }

  getContenido(){
    final responsive=ResponsiveUtil();
    return SingleChildScrollView(child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      CupertinoButton(
        minSize: responsive.isVertical()
            ? responsive.altoP(6)
            : responsive.anchoP(5),
        padding: const EdgeInsets.all(3),
        borderRadius: BorderRadius.circular(35),
        color: Colors.black,
        onPressed: () =>
            Get.back(),
        //volver atras
        child: Icon(
          Icons.arrow_back,
          color: Colors.white,
          size: responsive.isVertical()
              ? responsive.altoP(3.5)
              : responsive.anchoP(3.5),
        ),
      ),
      SizedBox(height: 10,),

      DateRangePickerDemo(),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(

            decoration: InputDecoration(labelText: 'Número de Personas',          filled: true,
              fillColor: Colors.white,),
            keyboardType: TextInputType.number,
            maxLength: 2,
            onChanged: (value) {

            },
          ),
        ),
      CreditCardForm(),
    SizedBox(height: 10,),

    Center(child:     ElevatedButton(
      onPressed: () {

      },
      child: Text('Pagar'),
    ),)


    ],),);
  }
}

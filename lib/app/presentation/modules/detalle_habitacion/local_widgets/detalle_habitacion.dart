import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:milicoreria/app/core/utils/responsiveUtil.dart';
import 'package:milicoreria/app/core/values/app_images.dart';
import 'package:milicoreria/app/presentation/widgets/custom_widgets.dart';

import '../../../../data/models/models.dart';

class DetalleHabitacion extends StatelessWidget {


  final HabitacionModel habitacionModel;

  final VoidCallback onPressed;

  const DetalleHabitacion(
      {super.key,

      required this.onPressed, required this.habitacionModel});

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtil();
    return Stack(
      children: [
        Container(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.asset(
                  habitacionModel.img, // Reemplaza con la URL de la imagen
                  fit: BoxFit.cover,
                  height: 250,
                  width: double.infinity,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        habitacionModel.titulo,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        habitacionModel.detalle,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white.withOpacity(0.6),
                        ),
                      ),
                      SizedBox(height: 8),
                      getCaslificacion(),
                      SizedBox(height: 16),
                      _buildFeature(
                          Icons.cleaning_services,
                          'Habitaciones limpias:',
                          'Ambientes siempre limpios y acogedores.'),
                      _buildFeature(Icons.support_agent, 'Atención 24 horas',
                          'Servicio de atención disponible las 24 horas.'),
                      _buildFeature(Icons.hot_tub, 'Agua caliente',
                          'Duchas reconfortantes con agua caliente.'),
                      _buildFeature(Icons.tv, 'Televisión',
                          'Disfrute de programas y películas en su habitación.'),
                      _buildFeature(
                          Icons.ac_unit,
                          'Aire acondicionado o calefacción',
                          'Climatización ideal con calefacción o aire acondicionado.'),
                      SizedBox(height: 16),
                    ],
                  ),
                ),
              ],
            ),
          ),
          height: responsive.altoP(80),
          width: double.infinity,
        ),

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
        Positioned(
          bottom: responsive.altoP(1),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            color: Colors.grey,
            width: responsive.ancho,
            child: Row(
              children: [
                Text(
                  'Precio: \$' + habitacionModel.precio.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(child: Container()),
                ElevatedButton(
                  onPressed: onPressed,
                  child: Text('Reservar'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    textStyle: TextStyle(fontSize: 14),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget getCaslificacion() {
    double starCount=habitacionModel.puntuacion;
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.white.withOpacity(0.5),
          width: 2.0,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Rating stars

          // Guest Favorite text
          Column(
            children: [
              Text(
                '4.5',
                style: TextStyle(
                    color: Colors.white70, fontWeight: FontWeight.bold),
              ),
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(5, (index) {
                    if (index < starCount.floor()) {
                      return Icon(
                        Icons.star,
                        color: Colors.yellow,
                      );
                    } else if (index < starCount &&
                        index == starCount.floor()) {
                      return Icon(
                        Icons.star_half,
                        color: Colors.yellow,
                      );
                    } else {
                      return Icon(
                        Icons.star_border,
                        color: Colors.yellow,
                      );
                    }
                  }),
                ),
              ),
            ],
          ),
          SizedBox(width: 10),
          // Reviews count with link
          Column(
            children: [
              Text(
                habitacionModel.visitas.toString(),
                style: TextStyle(
                    color: Colors.white70, fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () {
                  // Handle review link tap
                },
                child: Text(
                  'Visitas',
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFeature(IconData icon, String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        children: [
          Icon(
            icon,
            size: 30,
            color: Colors.white,
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

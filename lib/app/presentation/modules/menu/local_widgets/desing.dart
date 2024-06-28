import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:milicoreria/app/core/values/app_images.dart';
import 'package:milicoreria/app/presentation/widgets/custom_widgets.dart';

import '../../../../data/models/models.dart';
import '../../../routes/app_routes.dart';

class Desing extends StatelessWidget {
  final List<HabitacionModel> habitaciones;

  const Desing({super.key, required this.habitaciones});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Barra de búsqueda
        // getBtnFind(),
        // Iconos de categorías
        getIconsCategoria(),
        // Lista de elementos
        Expanded(
          child: ListView.builder(
            itemCount: habitaciones.length,
            itemBuilder: (BuildContext context, int i) {
              HabitacionModel data = habitaciones[i];
              return buildListItem(
                onTap: () {
                  Get.toNamed(AppRoutes.DETALLE_HABITACION,
                      arguments: {"data": data});


                },
                img: data.img,
                title: data.titulo,
                distance: data.detalle,
                date: 'Jan 1 - 6',
                price: '\$'+data.precio.toString(),
                rating: data.puntuacion,
              );
            },
          ),
        ),
        // Barra de navegación inferior
      ],
    );
  }

  getBtnFind() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Buscar...',
          prefixIcon: Icon(Icons.search),
          suffixIcon: Icon(Icons.filter_list),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
        ),
      ),
    );
  }

  getIconsCategoria() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          getDesingIconsCategoria(icon: Icons.house_sharp, text: "text1"),
          getDesingIconsCategoria(icon: Icons.person_2, text: "text1"),
          getDesingIconsCategoria(icon: Icons.castle, text: "text1"),
          getDesingIconsCategoria(icon: Icons.castle, text: "text1"),
        ],
      ),
    );
  }

  getDesingIconsCategoria({required IconData icon, required String text}) {
    final color = Colors.white;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        child: Column(
          children: [
            Icon(
              icon,
              color: color,
            ),
            Text(text, style: TextStyle(color: color)),
          ],
        ),
      ),
    );
  }

  Widget buildListItem(
      {required String img,
      required String title,
      required String distance,
      required String date,
      required String price,
      required double rating,
      GestureTapCallback? onTap}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          color: Colors.transparent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Imagen del lugar
              Container(
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(img),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              // Información del lugar
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(distance, style: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),),

                    Text(price.toString(), style: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber),
                        Text(rating.toString(), style: TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:milicoreria/app/presentation/widgets/custom_widgets.dart';

class Desing extends StatelessWidget {
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
          child: ListView(
            children: [
              buildListItem(
                onTap: (){
                  DialogosAwesome.getInformation(descripcion: "descripcion");
                },
                imageUrl: 'https://www.imghoteles.com/wp-content/uploads/sites/1709/nggallery/mobile-pics//slider-header-mobile4.jpg',
                title: 'Nusapenida, Indonesia',
                distance: '987 kilometers away',
                date: 'Jan 1 - 6',
                price: '\$234 /night',
                rating: 3.0,
              ),
              buildListItem(
                imageUrl: 'https://www.imghoteles.com/wp-content/uploads/sites/1709/nggallery/mobile-pics//lucero-mobile.jpg',
                title: 'Nusapenida, Indonesia',
                distance: '987 kilometers away',
                date: 'Jan 1 - 6',
                price: '\$234 /night',
                rating: 5.0,
              ),
              buildListItem(
                imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRonKxRHgVJyb7ftwoKF2EJF0pUTbe0LSUKsQ&s',
                title: 'Nusapenida, Indonesia',
                distance: '987 kilometers away',
                date: 'Jan 1 - 6',
                price: '\$234 /night',
                rating: 5.0,
              ),
              // Agrega más elementos aquí
            ],
          ),
        ),
        // Barra de navegación inferior

      ],
    );

    return Scaffold(
      bottomNavigationBar:      BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Wishlists',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
      body: SafeArea(

        child: Column(
          children: [
            // Barra de búsqueda
            getBtnFind(),
            // Iconos de categorías
            getIconsCategoria(),
            // Lista de elementos
            Expanded(
              child: ListView(
                children: [
                  buildListItem(
                    imageUrl: 'https://www.imghoteles.com/wp-content/uploads/sites/1709/nggallery/mobile-pics//slider-header-mobile4.jpg',
                    title: 'Nusapenida, Indonesia',
                    distance: '987 kilometers away',
                    date: 'Jan 1 - 6',
                    price: '\$234 /night',
                    rating: 5.0,
                  ),
                  buildListItem(
                    imageUrl: 'https://www.imghoteles.com/wp-content/uploads/sites/1709/nggallery/mobile-pics//lucero-mobile.jpg',
                    title: 'Nusapenida, Indonesia',
                    distance: '987 kilometers away',
                    date: 'Jan 1 - 6',
                    price: '\$234 /night',
                    rating: 5.0,
                  ),
                  buildListItem(
                    imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRonKxRHgVJyb7ftwoKF2EJF0pUTbe0LSUKsQ&s',
                    title: 'Nusapenida, Indonesia',
                    distance: '987 kilometers away',
                    date: 'Jan 1 - 6',
                    price: '\$234 /night',
                    rating: 5.0,
                  ),
                  // Agrega más elementos aquí
                ],
              ),
            ),
            // Barra de navegación inferior

          ],
        ),
      ),
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
      ),),
    );
  }

  Widget buildListItem({
    required String imageUrl,
    required String title,
    required String distance,
    required String date,
    required String price,
    required double rating,
    GestureTapCallback? onTap
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,

        child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagen del lugar
            Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
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
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(distance),
                  Text(date),
                  Text(price),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber),
                      Text(rating.toString()),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),),
    );
  }
}

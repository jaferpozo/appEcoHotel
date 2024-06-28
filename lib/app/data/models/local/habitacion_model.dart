part of '../models.dart';
class HabitacionModel {
  final double precio;
  final String titulo;
  final String detalle;
  final double puntuacion;
  final int visitas;
  final String img;

  HabitacionModel(
      {required this.precio,
      required this.titulo,
      required this.detalle,
      required this.puntuacion,
      required this.visitas,
      required this.img});
}

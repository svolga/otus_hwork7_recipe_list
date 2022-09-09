import 'package:equatable/equatable.dart';

class RecipeEntity extends Equatable {
  final int id;
  final String name;
  final int duration;
  final String photo;

  const RecipeEntity(
      {required this.id,
      required this.name,
      required this.duration,
      required this.photo});

  @override
  List<Object> get props => [id, name, duration, photo];
}

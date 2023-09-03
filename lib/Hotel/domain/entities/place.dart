import 'package:equatable/equatable.dart';

class Place extends Equatable {
  final String name;
  final String background;

  const Place({required this.name, required this.background});
  @override
  List<Object?> get props => [name, background];
}

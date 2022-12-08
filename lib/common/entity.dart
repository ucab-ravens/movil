import 'package:movil/common/value_object.dart';

abstract class Entity<T extends ValueObject<T>> {
  final T id;

  Entity(this.id);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Entity<T> &&
      runtimeType == other.runtimeType &&
      id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'Entity{id: $id}';
  }
}
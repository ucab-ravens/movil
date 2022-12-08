
import 'package:movil/common/entity.dart';
import 'package:movil/common/value_object.dart';

abstract class AggregateRoot<T extends ValueObject<T>> extends Entity<T> {
  AggregateRoot(T id) : super(id);

  /// TODO: Implementar eventos de dominio
}

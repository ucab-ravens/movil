import 'package:movil/modules/shared/domain/entity.dart';
import 'package:movil/modules/shared/domain/value_object.dart';

abstract class AggregateRoot<T extends ValueObject<T>> extends Entity<T> {
  AggregateRoot(T id) : super(id);

  /// TODO: Implementar eventos de dominio
}

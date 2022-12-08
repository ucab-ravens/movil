import 'package:fpdart/fpdart.dart';

/// Envolvemos el resultado en un [Result], así no tendremos
/// que usar try-catch en el resto de la aplicación.
typedef Result<T> = Either<Exception, T>;

/// Resultado para funciones asincronas, envolvemos
/// haciendo uso de la clase [TaskEither]
typedef ResultAsync<T> = Future<Result<T>>;

/// Resultado de éxito
typedef Success<T> = Right<Exception, T>;

/// Resultado de error
typedef Error<T> = Left<Exception, T>;

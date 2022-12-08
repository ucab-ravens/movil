import 'package:movil/modules/local_storage/local_storage_config.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class LocalStorage {
  late final Database _database;

  Future<Database> open() async {
    // Obtenemos el directorio donde se almacenarán
    // los archivos de la base de datos
    final databasePath =
        join(await getDatabasesPath(), databaseConfig['filename'] as String);

    // Abrimos la base de datos
    _database = await openDatabase(
      databasePath,
      version: databaseConfig['version'] as int,
      onCreate: (db, version) async {
        // Creamos el esquema de la base de datos
        // ejecutado solo la primera vez que se
        // crea el archivo .db
        await db.execute(databaseConfig['scheme'] as String);
      },
    );
    return _database;
  }

  Future<void> close() async {
    await _database.close();
  }

  Future<int> insert(String sql, [List<dynamic>? args]) async {
    return await _database.rawInsert(sql, args);
  }

  Future<List<Map<String, dynamic>>> query(String sql,
      [List<dynamic>? args]) async {
    return await _database.rawQuery(sql, args);
  }

  Future<int> update(String sql, [List<dynamic>? args]) async {
    return await _database.rawUpdate(sql, args);
  }

  Future<int> delete(String sql, [List<dynamic>? args]) async {
    return await _database.rawDelete(sql, args);
  }
}

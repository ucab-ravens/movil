const databaseConfig = {
  // Nombre del archivo para acceder a la
  // base de datos
  'filename': 'local_storage.db',
  // Versión de la base de datos
  'version': 2,
  // Esquema para crear la base de datos
  'scheme': '''
    CREATE TABLE courses (
      id INTEGER PRIMARY KEY,
      title TEXT,
      description TEXT,
      image TEXT
    )
  ''',
};

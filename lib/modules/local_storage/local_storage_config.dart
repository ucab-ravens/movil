const databaseConfig = {
  // Nombre del archivo para acceder a la
  // base de datos
  'filename': 'local_storage.db',
  // Versión de la base de datos
  'version': 6,
  // Esquema para crear la base de datos
  'course_scheme': '''
    CREATE TABLE courses (
      id INTEGER PRIMARY KEY,
      title TEXT,
      subtitle TEXT,
      description TEXT,
      image TEXT
    );
  ''',
  'lesson_scheme': '''
    CREATE TABLE lessons (      
      title TEXT,
      course_id INTEGER,
      description TEXT,
      video_url TEXT
    );
  ''',
};

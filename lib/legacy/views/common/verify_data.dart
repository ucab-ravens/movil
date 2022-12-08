import 'package:flutter/material.dart';
import '../courses_view/courses_grid.dart';

Widget verifyData(AsyncSnapshot snapshot) {
  return
      // Si el estado de la conexion esta en espera, genera un CircularProgressIndicator de carga
      (snapshot.connectionState == ConnectionState.waiting)
          ? const SliverFillRemaining(
              child: Center(
              child: CircularProgressIndicator(),
            ))

          // Si el estado de la conexion es lista
          : (snapshot.connectionState == ConnectionState.done)

              //Si hay datos
              ? (snapshot.hasData)

                  // Si los datos no estan vacios
                  ? (snapshot.data.isNotEmpty)

                      // Si el estado de la conexion es lista y hay data, crea el cuerpo de la pagina
                      ? CourseGrid(snapshot.data)

                      // Si el estado de la conexion es lista, hay data y esta vacia
                      : const SliverFillRemaining(
                          child: Center(
                          child: Text(
                            'Data Vacia',
                            style: TextStyle(fontSize: 18),
                          ),
                        ))

                  // Si el estado de la conexion es lista y no hay data, muestra Error
                  : const SliverFillRemaining(
                      child: Center(
                      child: Text(
                        'No hay coincidencias',
                        style: TextStyle(fontSize: 18),
                      ),
                    ))

              // Si el estado de la conexion no esta lista
              : const SliverFillRemaining(
                  child: Center(
                      child: Text(
                    '??',
                    style: TextStyle(fontSize: 18),
                  )),
                );
}

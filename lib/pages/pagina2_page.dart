import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:estadosapp/bloc/usuario/usuario_bloc.dart';

import 'package:estadosapp/models/usuario.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final blocProvider = BlocProvider.of<UsuarioBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<UsuarioBloc, UsuarioState>(
          builder: (_, state) {
            if (state.existeUsuario) {
              return Text(state.usuario!.nombre);
            } else {
              return const Text('Pagina 2');
            }
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
                child: const Text(
                  'Establecer usuario',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
                onPressed: () {
                  blocProvider.add(ActivarUsuario(Usuario(
                      nombre: 'Johan',
                      edad: 24,
                      profesiones: [
                        'FullStack Developer',
                        'Analist of Software'
                      ])));
                }),
            BlocBuilder<UsuarioBloc, UsuarioState>(
              builder: (_, state) {
                if (state.existeUsuario) {
                  return BotonesAdicionales(blocProvider, true);
                } else {
                  return BotonesAdicionales(blocProvider, false);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class BotonesAdicionales extends StatelessWidget {
  final UsuarioBloc blocProvider;
  final bool estado;
  const BotonesAdicionales(this.blocProvider, this.estado);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MaterialButton(
            child: const Text(
              'Cambiar edad',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.blue,
            onPressed: estado
                ? () {
                    blocProvider.add(CambiarEdad(20));
                  }
                : null),
        MaterialButton(
            child: const Text(
              'Añadir Profesión',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.blue,
            onPressed: estado
                ? () {
                    blocProvider.add(AgregarProfesion('Soccer Player'));
                  }
                : null),
      ],
    );
  }
}

part of 'usuario_bloc.dart';

class UsuarioState {
  final bool existeUsuario;
  final Usuario? usuario;

  UsuarioState({Usuario? user})
      : usuario = user,
        existeUsuario = (user != null) ? true : false;

  UsuarioState copyWith({Usuario? user}) => UsuarioState(user: user ?? usuario);

  UsuarioState estadoInicial() => UsuarioState();
}

import 'dart:async';

class LoginBloc{

  final _emailController = StreamController<String>.broadcast();
  final _claveController = StreamController<String>.broadcast();
  //-----------validar datos---------
  Stream<String> get emailStream => _emailController.stream;
  Stream<String> get claveStream => _claveController.stream;
  //-------------get-----------------
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changeClave => _claveController.sink.add;

  dispose(){
    _emailController?.close();
    _claveController?.close();
  }
}
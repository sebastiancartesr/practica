import 'package:flutter/material.dart';
import 'package:newlogin/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        _Fondo(context),
        _loginFrom(context),
      ],
    ));
  }

  Widget _loginFrom(context) {
    final bloc = Provider.of(context);
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SafeArea(
            child: Container(
              height: 150.0,
            ),
          ),
          Container(
            width: size.width * 0.85,
            margin: EdgeInsets.symmetric(vertical: 30.0),
            padding: EdgeInsets.symmetric(vertical: 50.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 3.0,
                      offset: Offset(0.0, 5.0),
                      spreadRadius: 3.0)
                ]),
            child: Column(
              children: <Widget>[
                Text(
                  'Ingreso',
                  style: TextStyle(fontSize: 20.0),
                ),
                SizedBox(height: 60.0),
                _email(bloc),
                SizedBox(height: 30.0),
                _clave(bloc),
                SizedBox(height: 30.0),
                _boton(),
              ],
            ),
          ),
          Text('ingresar como paciente'),
          SizedBox(
            height: 80.0,
          )
        ],
      ),
    );
  }

  Widget _email(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              icon: Icon(
                Icons.email_outlined,
                color: Colors.black,
              ),
              hintText: 'ejemplo@correo.com',
              labelText: 'Correo electronico',
            ),
            onChanged: bloc.changeEmail,
          ),
        );
      },
    );
  }

  Widget _clave(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.claveStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            obscureText: true,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              icon: Icon(
                Icons.lock_outline,
                color: Colors.black,
              ),
              labelText: 'Contraseña',
            ),
            onChanged: bloc.changeClave,
          ),
        );
      },
    );
  }

  Widget _boton() {
    return RaisedButton(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
        child: Text('Ingresar'),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      elevation: 0.0,
      color: Color.fromRGBO(189, 219, 255, 1),
      onPressed: () {},
    );
  }

  Widget _Fondo(context) {
    final size = MediaQuery.of(context).size;
    final fondoarriba = Container(
      height: size.height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(color: Color.fromRGBO(189, 219, 255, 1)),
    );
    return Stack(
      children: <Widget>[
        fondoarriba,
        Container(
          padding: EdgeInsets.only(top: 50.0),
          child: Column(
            children: <Widget>[
              Image.asset(
                'images/medico.png',
                width: 100,
                height: 100,
              ),
              SizedBox(
                height: 10.0,
                width: double.infinity,
              ),
              Text(
                'Login Medico',
                style: TextStyle(color: Colors.black, fontSize: 25.0),
              )
            ],
          ),
        )
      ],
    );
  }
}

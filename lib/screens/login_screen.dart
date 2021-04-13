import 'package:app_bancaria/screens/sidebar_layout.dart';
import 'package:app_bancaria/services/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _user, _password;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFFFFAFB),
        body: Stack(
          children: <Widget>[
            Center(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    // IMAGEN CON MENSAJE DE BIENVENIDA
                    Container(
                      padding: EdgeInsets.only(bottom: 48.0),
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            'images/login.svg',
                            width: width * 0.4,
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Text(
                            'Bienvenido!',
                            style: TextStyle(
                              fontFamily: 'Merienda',
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: kPrimaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // FORMULARIO
                    Container(
                      padding: EdgeInsets.fromLTRB(50.0, 0, 50.0, 0),
                      child: Column(children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(bottom: 20.0),
                          child: TextField(
                            style: TextStyle(color: Colors.white),
                            onChanged: (value) {
                              _user = value;
                            },
                            decoration: kTextFieldDecoration.copyWith(
                              labelText: 'Usuario',
                              prefixIcon: Icon(Icons.person),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(bottom: 40.0),
                          child: TextField(
                            obscureText: true,
                            style: TextStyle(color: Colors.white),
                            onChanged: (value) {
                              _password = value;
                            },
                            decoration: kTextFieldDecoration.copyWith(
                                labelText: 'Contraseña',
                                prefixIcon: Icon(Icons.lock)),
                          ),
                        ),
                        FractionallySizedBox(
                          widthFactor: 1,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: kPrimaryColor,
                              onPrimary: Color(0xFFFFFFFF),
                              elevation: 0,
                              padding: EdgeInsets.symmetric(
                                vertical: 15.0,
                                horizontal: 10.0,
                              ),
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SidebarLayout()));
                            },
                            child: Text('Iniciar sesión'),
                          ),
                        ),
                      ]),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

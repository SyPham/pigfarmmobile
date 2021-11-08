import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pigfarm/login/bloc/login_bloc.dart';
import 'package:pigfarm/repositories/authentication_repository.dart';
import 'package:pigfarm/repositories/secure_storage.dart';
import 'package:pigfarm/repositories/user_repository.dart';

import 'login_form.dart';
import 'dart:math';
import 'package:pigfarm/widgets/customClipper.dart';


class LoginPage2 extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => LoginPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: BlocProvider(
          create: (context) {
            return LoginBloc(
              authenticationRepository:
                  RepositoryProvider.of<AuthenticationRepository>(context),
                   userRepository:
                  RepositoryProvider.of<SecureStorage>(context),
            );
          },
          child: LoginForm(),
        ),
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => LoginPage());
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
      height: height,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: -MediaQuery.of(context).size.height * .15,
            right: -MediaQuery.of(context).size.width * .4,
            child: Container(
                child: Transform.rotate(
              angle: -pi / 3.5,
              child: ClipPath(
                clipper: ClipPainter(),
                child: Container(
                  height: MediaQuery.of(context).size.height * .5,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        HexColor("#fd8600"),
                        HexColor("#eb9431"),
                      ],
                    ),
                  ),
                ),
              ),
            )),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: BlocProvider(
              create: (context) {
                return LoginBloc(
                  authenticationRepository:
                      RepositoryProvider.of<AuthenticationRepository>(context),
                   userRepository:
                  RepositoryProvider.of<SecureStorage>(context),
                );
              },
              child: LoginForm(),
            ),
          ),
          Positioned(
            top: 40,
            left: 0,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
                      child:
                          Icon(Icons.keyboard_arrow_left, color: Colors.black),
                    ),
                    Text('Back',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w500))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

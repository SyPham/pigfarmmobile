import 'package:pigfarm/repositories/authentication_repository.dart';
import 'package:pigfarm/repositories/secure_storage.dart';
import 'package:pigfarm/repositories/user_repository.dart';
import 'package:pigfarm/welcome.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app.dart';

void main() => runApp(App(
      authenticationRepository: AuthenticationRepository(),
      userRepository: SecureStorage(),
    ));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      title: 'Pig Farm',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        textTheme: GoogleFonts.latoTextTheme(textTheme).copyWith(
          bodyText1: GoogleFonts.montserrat(textStyle: textTheme.bodyText1),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    );
  }
}

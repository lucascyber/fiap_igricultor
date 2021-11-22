import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:igricultor_app/auth/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'iGricultor App',
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
      },
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
    );
  }
}

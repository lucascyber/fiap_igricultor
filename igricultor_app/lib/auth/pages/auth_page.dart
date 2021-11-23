import 'package:flutter/material.dart';
import 'package:igricultor_app/auth/widgets/login_form.dart.dart';
import 'package:igricultor_app/auth/widgets/signup_form.dart.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  late bool _isLogin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: _isLogin
                ? LoginForm(
                    onChangePage: () => setState(() => _isLogin = false),
                    onLogin: () => Navigator.pushNamed(context, '/home'),
                  )
                : SignUpForm(
                    onChangePage: () => setState(() => _isLogin = true),
                    onSignUp: () => {},
                  ),
          ),
        ],
      ),
    );
  }
}

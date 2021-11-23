import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final VoidCallback onChangePage;
  final VoidCallback onSignUp;

  SignUpForm({
    Key? key,
    required this.onChangePage,
    required this.onSignUp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Text(
              'REGISTRE-SE',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.green.shade700),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 50,
              child: TextFormField(
                decoration: _inputDecoration('Nome completo'),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 50,
              child: TextFormField(
                decoration: _inputDecoration('CPF / CNPJ'),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 50,
              child: TextFormField(
                decoration: _inputDecoration('Seu e-mail'),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 50,
              child: TextFormField(
                decoration: _inputDecoration('Estado'),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 50,
              child: TextFormField(
                decoration: _inputDecoration('Cidade'),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 50,
              child: TextFormField(
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                decoration: _inputDecoration('Senha'),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 50,
              child: TextFormField(
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                decoration: _inputDecoration('Confirmar senha'),
              ),
            ),
            const SizedBox(height: 15),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Já possui conta? ',
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 14,
                    ),
                  ),
                  TextSpan(
                    text: 'Faça login',
                    style: TextStyle(
                      color: Colors.green.shade700,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        onChangePage();
                      },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: double.infinity,
              height: 40,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: Colors.green.shade700,
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                onPressed: () => onSignUp(),
                child: const Text('REGISTRAR'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      hintText: label,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          width: 2,
          color: Colors.green.shade700,
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

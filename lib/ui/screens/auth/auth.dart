import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AuthPage extends StatefulWidget {
  AuthPage({Key key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _passConfrimController = TextEditingController();

  // Indicates if it is in login or sign in form, default login
  bool _isLogin = true;
  String _pass;

  @override
  void initState() {
    super.initState();

    _passController.addListener(() {
      _pass = _passController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isLogin ? 'Login' : 'Registro'),
        centerTitle: true,
      ),
      // Build the form
      body: Container(
        margin: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  hintText: 'Ingresa tu email',
                ),
                validator: (String value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingresa in valor';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _passController,
                decoration: const InputDecoration(
                  hintText: 'Ingresa una contraseña',
                ),
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                validator: (String value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingresa un valor';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 10,
              ),
              if (!_isLogin)
                TextFormField(
                  controller: _passConfrimController,
                  decoration: const InputDecoration(
                    hintText: 'Confirma la contraseña',
                  ),
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  validator: (String value) {
                    if (value == null || value.isEmpty) {
                      return 'Ingresa un valor';
                    }
                    if (value != _pass) {
                      return 'Las contraseñas no coinciden';
                    }
                    return null;
                  },
                ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: _handleSubmit,
                  child: Text(_isLogin ? 'Login' : 'Registrarse'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      _isLogin = !_isLogin;
                    });
                  },
                  child: Text(
                    _isLogin
                        ? 'No tengo cuenta, Restistrarme'
                        : 'Ya tengo una cuenta',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    _passConfrimController.dispose();
    super.dispose();
  }

  Future<void> _handleSubmit() async {
    // Validate will return true if the form is valid, or false if
    // the form is invalid.
    if (_formKey.currentState.validate()) {
      // Process data.
    }
  }
}

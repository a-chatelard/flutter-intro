import 'package:flutter/material.dart';
import 'package:projects/app/screens/calculator/calculator_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  AutovalidateMode _autovalidate = AutovalidateMode.disabled;

  void _onSubmit() {
    if (_formKey.currentState!.validate()) {
      if (_usernameController.text == "admin@admin.admin" &&
          _passwordController.text == "password") {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => CalculatorPage()));
      }
    } else {}
    setState(() {
      _autovalidate = AutovalidateMode.always;
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Material(
      child: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "SIGN IN",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
              ),
              Padding(padding: EdgeInsets.only(top: 50)),
              Padding(
                padding: EdgeInsets.only(left: 60, right: 60, bottom: 50),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          icon: Icon(Icons.person), labelText: "Email"),
                      controller: _usernameController,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Field cannot be empty.";
                        } else if (!RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value)) {
                          return "Please enter a valid email adress.";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          icon: Icon(Icons.lock), labelText: "Password"),
                      controller: _passwordController,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Field cannot be empty.";
                        }
                        return null;
                      },
                    )
                  ],
                ),
              ),
              ElevatedButton(
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
                ),
                onPressed: _onSubmit,
              ),
              Padding(padding: EdgeInsets.only(top: 30)),
              Text("Don't have an account ?"),
              OutlinedButton(
                child: Text(
                  "Create an account",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
                ),
                onPressed: null,
              )
            ],
          ),
        ),
      ),
    );
  }
}

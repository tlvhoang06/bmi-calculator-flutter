import 'package:demo/data/notifer.dart';
import 'package:demo/views/widget_tree.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPassWordController = TextEditingController();
  String errorMessage = ' ';
  final formKey = GlobalKey<FormState>();
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPassWordController.dispose();
    super.dispose();
  }

  void register() async {
    try {
      await authServices.value.createAccount(
        email: _emailController.text,
        password: _passwordController.text,
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return WidgetTree();
          },
        ),
      );
    } on FirebaseAuthException catch (error) {
      setState(() {
        errorMessage = error.message ?? 'Error!';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDarkMode.value ? Color(0XFF0d1b2a) : Color(0XFFedeec9),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Lottie.asset('assets/lotties/login.json'),

                // Display Name
                TextField(
                  controller: _nameController,
                  style: TextStyle(
                    color: isDarkMode.value ? Colors.white : Colors.black,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0XFF1b4965)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: 'Display Name',
                    hintStyle: TextStyle(
                      color: (isDarkMode.value ? Colors.white : Colors.black),
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 30),
                  ),
                  inputFormatters: [LengthLimitingTextInputFormatter(20)],
                ),
                SizedBox(height: 15),

                // Email
                TextField(
                  controller: _emailController,
                  style: TextStyle(
                    color: isDarkMode.value ? Colors.white : Colors.black,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0XFF1b4965)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: 'Email',
                    hintStyle: TextStyle(
                      color: (isDarkMode.value ? Colors.white : Colors.black),
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 30),
                  ),
                  inputFormatters: [LengthLimitingTextInputFormatter(20)],
                ),
                SizedBox(height: 15),

                // Password
                TextField(
                  controller: _passwordController,
                  style: TextStyle(
                    color: isDarkMode.value ? Colors.white : Colors.black,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0XFF1b4965)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: 'Password',
                    hintStyle: TextStyle(
                      color: (isDarkMode.value ? Colors.white : Colors.black),
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 30),
                  ),
                  inputFormatters: [LengthLimitingTextInputFormatter(20)],
                  obscureText: true, // hide text
                ),
                SizedBox(height: 15),

                // Confirm Password
                TextField(
                  controller: _confirmPassWordController,
                  style: TextStyle(
                    color: isDarkMode.value ? Colors.white : Colors.black,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0XFF1b4965)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: 'Confirm Password',
                    hintStyle: TextStyle(
                      color: (isDarkMode.value ? Colors.white : Colors.black),
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 30),
                  ),
                  inputFormatters: [LengthLimitingTextInputFormatter(20)],
                  obscureText: true, // hide text
                ),

                SizedBox(height: 10),
                Text(errorMessage, style: TextStyle(color: Colors.red)),
                SizedBox(height: 30),

                SizedBox(
                  height: 60,
                  child: FilledButton(
                    onPressed: () {
                      if (_passwordController.text ==
                          _confirmPassWordController.text) {
                        register();
                      } else {
                        setState(() {
                          errorMessage = "Password does not match";
                        });
                      }
                    },
                    style: FilledButton.styleFrom(
                      elevation: 3,
                      minimumSize: Size(double.infinity, 40),
                      backgroundColor: Color(0XFFc0fdff),
                      foregroundColor: Colors.black,
                    ),
                    child: Text('Sign up'),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: TextStyle(
                        color: isDarkMode.value
                            ? Colors.grey.shade100
                            : Colors.grey.shade700,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: TextButton.styleFrom(
                        minimumSize: Size(0, 0),
                        padding: EdgeInsets.symmetric(
                          vertical: 0,
                          horizontal: 10,
                        ),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.blue.shade300,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.blue.shade300,
                          decorationThickness: 2,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

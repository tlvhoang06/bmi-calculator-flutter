import 'package:demo/data/notifer.dart';
import 'package:demo/views/pages/forget_password.dart';
import 'package:demo/views/pages/register_page.dart';
import 'package:demo/views/widget_tree.dart';
import 'package:demo/views/widgets/auth_button.dart';
import 'package:demo/views/widgets/customized_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = 'Truong Le Vu Hoang';

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String errorMessage = '';
  bool showPassWord = false;

  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void login() async {
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      setState(() {
        errorMessage = "Email and Password can't be empty";
      });
      return;
    }
    try {
      await authServices.value.signIn(
        email: _emailController.text,
        password: _passwordController.text,
      );
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Logged in as ${name}'),
          duration: Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
        ),
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
      print(error.code);
      print("❌ LOGIN ERROR -> code: ${error.code}, message: ${error.message}");
      setState(() {
        errorMessage = error.message ?? "Login failed!";
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset('assets/lotties/login.json'),

                // Email
                CustomizedTextfield(
                  controller: _emailController,
                  hintText: "Email",
                  hideText: false,
                ),
                SizedBox(height: 15),

                // Password
                CustomizedTextfield(
                  controller: _passwordController,
                  hintText: "Password",
                  hideText: !showPassWord,
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Show Password
                    Row(
                      children: [
                        Checkbox(
                          activeColor: Color(0XFFc0fdff),
                          checkColor: Colors.black,
                          value: showPassWord,
                          onChanged: (value) {
                            setState(() {
                              showPassWord = !showPassWord;
                            });
                          },
                        ),
                        Text(
                          'Show password',
                          style: TextStyle(
                            color: (isDarkMode.value
                                ? Colors.white
                                : Colors.black),
                          ),
                        ),
                      ],
                    ),

                    // Forgot password
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return SendPasswordResetEmail();
                            },
                          ),
                        );
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
                        'Forgot password?',
                        style: TextStyle(color: Colors.blue.shade300),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),

                // Error Message
                if (errorMessage.isNotEmpty)
                    Text(errorMessage, style: TextStyle(color: Colors.red)),
                SizedBox(height: 30),

                // Login Button
                AuthButton(action: login, buttonText: "Login"),
                SizedBox(height: 10),

                // Dont have account
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account yet?',
                      style: TextStyle(
                        color: isDarkMode.value
                            ? Colors.grey.shade100
                            : Colors.grey.shade700,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return RegisterPage();
                            },
                          ),
                        );
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
                        'Sign up',
                        style: TextStyle(color: Colors.blue.shade300),
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

import 'package:demo/data/constants.dart';
import 'package:demo/data/notifer.dart';
import 'package:demo/views/widget_tree.dart';
import 'package:demo/views/widgets/customized_textfield.dart';
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
  bool showPassWord = false;
  final formKey = GlobalKey<FormState>();
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPassWordController.dispose();
    super.dispose();
  }

  void register() async {
    if(_emailController.text.isEmpty || _passwordController.text.isEmpty){
      setState(() {
        errorMessage = "Email and Password can't be empty";
      });
      return;
    }
    if (_passwordController.text != _confirmPassWordController.text) {
      setState(() {
        errorMessage = "Password does not match";
      });
      return;
    }
    try {
      await authServices.value.createAccount(
        email: _emailController.text,
        password: _passwordController.text,
      );
      if(!mounted)  return;
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
        errorMessage = error.message ?? 'Register failed!';
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
                CustomizedTextfield(controller: _nameController, hintText: "Display Name", hideText: false,),
                SizedBox(height: 15),

                // Email
                CustomizedTextfield(controller: _emailController, hintText: "Email", hideText: false,),
                SizedBox(height: 15),

                // Password
                CustomizedTextfield(controller: _passwordController, hintText: "Password", hideText: !showPassWord),
                SizedBox(height: 15),

                // Confirm Password
                CustomizedTextfield(controller: _confirmPassWordController, hintText: "Confirm Password", hideText: !showPassWord),

                SizedBox(height: 10),
                Text(errorMessage, style: TextStyle(color: Colors.red)),
                SizedBox(height: 5),
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
                SizedBox(height: 10),
                SizedBox(
                  height: 60,
                  child: FilledButton(
                    onPressed: () {
                      register();
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

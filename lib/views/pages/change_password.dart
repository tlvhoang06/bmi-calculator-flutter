import 'package:demo/data/notifer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ManagePasswordPageState();
}

class _ManagePasswordPageState extends State<ChangePassword> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _currentPassWordController = TextEditingController();
  TextEditingController _newPassWordController = TextEditingController();
  String errorMessage = ' ';
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    void dispose() {
      _emailController.dispose();
      _currentPassWordController.dispose();
      _newPassWordController.dispose();
      super.dispose();
    }

    void changePassword() async {
      try {
        await authServices.value.changePassword(
          email: _emailController.text,
          currentPassWord: _currentPassWordController.text,
          newPassWord: _newPassWordController.text,
        );
        ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Password Changed!'),
          duration: Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
        ),
      );
      Navigator.pop(
        context,
      );
      } on FirebaseException catch (error) {
        setState(() {
          errorMessage = error.message ?? "Change password failed!";
        });
      }
    }

    return Scaffold(
      backgroundColor: isDarkMode.value ? Color(0XFF0d1b2a) : Color(0XFFedeec9),
      appBar: AppBar(backgroundColor: Color(0XFFc0fdff),),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset('assets/lotties/login.json'),
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
                SizedBox(height: 10),
                TextField(
                  controller: _currentPassWordController,
                  obscureText: true,
                  style: TextStyle(
                    color: isDarkMode.value ? Colors.white : Colors.black,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: isDarkMode.value
                            ? Color(0XFF1b4965)
                            : Color(0XFFeaf4f4),
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: 'Curent password',
                    hintStyle: TextStyle(
                      color: (isDarkMode.value ? Colors.white : Colors.black),
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 30),
                  ),
                  inputFormatters: [LengthLimitingTextInputFormatter(20)],
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _newPassWordController,
                  obscureText: true,
                  style: TextStyle(
                    color: isDarkMode.value ? Colors.white : Colors.black,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: isDarkMode.value
                            ? Color(0XFF1b4965)
                            : Color(0XFFeaf4f4),
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: 'New password',
                    hintStyle: TextStyle(
                      color: (isDarkMode.value ? Colors.white : Colors.black),
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 30),
                  ),
                  inputFormatters: [LengthLimitingTextInputFormatter(20)],
                ),
                SizedBox(height: 30),
                SizedBox(
                  height: 60,
                  child: FilledButton(
                    onPressed: () {
                      changePassword();
                    },
                    style: FilledButton.styleFrom(
                      elevation: 3,
                      minimumSize: Size(double.infinity, 40),
                      backgroundColor: Color(0XFFc0fdff),
                      foregroundColor: Colors.black,
                    ),
                    child: Text('Change Password'),
                  ),
                ),
                SizedBox(height: 10),
                Text(errorMessage, style: TextStyle(color: Colors.red)),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

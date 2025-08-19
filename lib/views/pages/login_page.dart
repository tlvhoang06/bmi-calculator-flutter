import 'package:demo/data/notifer.dart';
import 'package:demo/views/widget_tree.dart';
import 'package:demo/views/widgets/text_type_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  String name = 'Truong Le Vu Hoang';
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
                TextField(
                  style: TextStyle(
                    color: isDarkMode.value ? Colors.white : Colors.black,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0XFF1b4965)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: 'Username',
                    hintStyle: TextStyle(
                      color: (isDarkMode.value ? Colors.white : Colors.black),
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 30),
                  ),
                  inputFormatters: [LengthLimitingTextInputFormatter(20)],
                ),
                SizedBox(height: 10),
                TextField(
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
                    hintText: 'Password',
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
                    },
                    style: FilledButton.styleFrom(
                      elevation: 3,
                      minimumSize: Size(double.infinity, 40),
                      backgroundColor: Color(0XFFc0fdff),
                      foregroundColor: Colors.black,
                    ),
                    child: Text('Login'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

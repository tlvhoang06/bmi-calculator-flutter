import 'package:demo/views/widget_tree.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFedeec9),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset('assets/lotties/login.json'),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0XFF1b4965)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hint: Text('Username'),
                    contentPadding: EdgeInsets.symmetric(horizontal: 30),
                  ),
                  inputFormatters: [LengthLimitingTextInputFormatter(20)],
                ),
                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0XFF1b4965)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hint: Text('Password'),
                    contentPadding: EdgeInsets.symmetric(horizontal: 30),
                  ),
                  inputFormatters: [LengthLimitingTextInputFormatter(20)],
                ),
                SizedBox(height: 30),
                SizedBox(
                  height: 60,
                  child: FilledButton(
                    onPressed: () {
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

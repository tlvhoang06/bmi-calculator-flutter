import 'package:demo/data/notifer.dart';
import 'package:demo/views/widgets/auth_button.dart';
import 'package:demo/views/widgets/customized_textfield.dart';
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
  TextEditingController _confirmPassWordController = TextEditingController();
  String errorMessage = ' ';
  final formKey = GlobalKey<FormState>();
  void dispose() {
    _emailController.dispose();
    _currentPassWordController.dispose();
    _newPassWordController.dispose();
    _confirmPassWordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    void changePassword() async {
      if(_newPassWordController.text != _confirmPassWordController.text){
        setState(() {
          errorMessage = "Password does not match";
        });
        return;
      }
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
        Navigator.pop(context);
      } on FirebaseException catch (error) {
        setState(() {
          errorMessage = error.message ?? "Change password failed!";
        });
      }
    }

    return Scaffold(
      backgroundColor: isDarkMode.value ? Color(0XFF0d1b2a) : Color(0XFFedeec9),
      appBar: AppBar(
        backgroundColor: Color(0XFFc0fdff),
        title: Text("C H A N G E   P A S S W O R D"),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/security_icon.png',
                  height: 300,
                  width: 300,
                ),
                SizedBox(height: 70),

                // Email
                CustomizedTextfield(controller: _emailController, hintText: "Email", hideText: false),
                SizedBox(height: 10),

                // Current Password
                CustomizedTextfield(controller: _currentPassWordController, hintText: "Current Password", hideText: true),
                SizedBox(height: 10),

                // New Password
                CustomizedTextfield(controller: _newPassWordController, hintText: "New Password", hideText: true),
                SizedBox(height: 10),
                CustomizedTextfield(controller: _confirmPassWordController, hintText: "Confirm Password", hideText: true),
                SizedBox(height: 10),
                Text(errorMessage, style: TextStyle(color: Colors.red)),
                SizedBox(height: 30),
                AuthButton(action: changePassword, buttonText: "Change Password")
              ],
            ),
          ),
        ),
      ),
    );
  }
}

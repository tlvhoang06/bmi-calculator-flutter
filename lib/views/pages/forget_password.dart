import 'package:demo/data/notifer.dart';
import 'package:demo/views/widgets/auth_button.dart';
import 'package:demo/views/widgets/customized_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SendPasswordResetEmail extends StatefulWidget {
  const SendPasswordResetEmail({super.key});

  @override
  State<SendPasswordResetEmail> createState() => _SendPasswordResetEmailState();
}

class _SendPasswordResetEmailState extends State<SendPasswordResetEmail> {
  final TextEditingController _emailController = TextEditingController();
  String errorMessage = ' ';
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void SendRequest() async {
      if (_emailController.text.isEmpty) {
        setState(() {
          errorMessage = "Email can't be empty";
        });
        return;
      }
      try {
        await authServices.value.forgetPassWord(email: _emailController.text);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Sent Request"),
            duration: Duration(seconds: 2),
            behavior: SnackBarBehavior.floating,
          ),
        );
      } on FirebaseException catch (error) {
        setState(() {
          errorMessage = error.message ?? "Request Failed!";
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
                CustomizedTextfield(
                  controller: _emailController,
                  hintText: "Email",
                  hideText: false,
                ),
                SizedBox(height: 10),

                SizedBox(height: 10),
                Text(errorMessage, style: TextStyle(color: Colors.red)),
                SizedBox(height: 30),
                AuthButton(action: SendRequest, buttonText: "Send Request"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

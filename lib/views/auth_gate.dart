import 'package:demo/data/notifer.dart';
import 'package:demo/views/pages/login_page.dart';
import 'package:demo/views/widget_tree.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: authServices,
      builder: (context, value, child) {
        return StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(), builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){   // spinner
            return Scaffold(body: Center(child: CircularProgressIndicator()));
          }
          else if(snapshot.hasData){  // user logged in
            return WidgetTree();
          }
          return LoginPage();   // user not logged in
        },);
      }
    );
  }
}
import 'package:firebase_auth/firebase_auth.dart';

class CurrentUserData{
  User? get user => FirebaseAuth.instance.currentUser;
  String get displayName{
    if(user == null){
      return "Guest";
    }
    return user!.displayName ?? user!.email ?? "User";
  }
}
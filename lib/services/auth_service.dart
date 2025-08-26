import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  User? get user => firebaseAuth.currentUser;
  Stream<User?> get authStateChanges => firebaseAuth.authStateChanges();

  // Sign in
  Future<UserCredential> signIn({
    required String email,
    required String password,
  }) async {
    return await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  // Sign up
  Future<UserCredential> createAccount({
    required String email,
    required String password,
  }) async {
    return await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  // Sign out
  Future<void> signOut() async{
    return await firebaseAuth.signOut();
  }

  // Change Password
  Future<void> changePassword({required String email, required String currentPassWord, required String newPassWord}) async{
    AuthCredential credential = EmailAuthProvider.credential(email: email, password: currentPassWord);
    await user!.reauthenticateWithCredential(credential);
    await user!.updatePassword(newPassWord);
  }
  
  // Forget Password
  Future<void> forgetPassWord({required String email}) async{
    return await firebaseAuth.sendPasswordResetEmail(email: email);
  }
  
  // update UserName
  Future<void> updateUserName({required String username}) async{
    return await user!.updateDisplayName(username);
  }
}

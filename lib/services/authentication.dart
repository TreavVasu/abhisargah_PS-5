import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
class Authentication{
  FirebaseAuth _auth=FirebaseAuth.instance;

  Stream<User?> get isAuthenticated {
    return   _auth.authStateChanges();
  }

  Future<void> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredent-ial
    UserCredential result= await _auth.signInWithCredential(credential);

    return;
  }
  Future<void> signOutUser() async {
    await FirebaseAuth.instance.signOut();
  }
}
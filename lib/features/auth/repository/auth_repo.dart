import 'package:flutter_application_1/core/imports/imports.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<void> signUp(String email, String password) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw Exception('Error signing up: ${e.message}');
    } catch (e) {
      throw Exception('Unknown error: $e');
    }
  }

  Future<void> login(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw Exception('Error logging in: ${e.message}');
    } catch (e) {
      throw Exception('Unknown error: $e');
    }
  }

  Future<void> logout() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      throw Exception('Error logging out: $e');
    }
  }

  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<User?> loginWithGoogle() async {
    try {
      final GoogleSignInAccount? googleuser = await _googleSignIn.signIn();
      if (googleuser == null) {
        return null;
      }
      final GoogleSignInAuthentication googleAuth =
          await googleuser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        // accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential = await _firebaseAuth
          .signInWithCredential(credential);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      throw Exception('Error logging in with Google: ${e.message}');
    } catch (e) {
      throw Exception('Unknown error: $e');
    }
  }

  // Future<void> updateProfile(String username, String phoneNumber) async {
  //   try {
  //     await FirebaseFirestore.instance.collection('users').doc(_firebaseAuth.currentUser?.uid).update({
  //       'username': username,
  //       'phoneNumber': phoneNumber,
  //     });
  //   } catch (e) {
  //     throw Exception('Error updating profile: $e');
  //   }
  // }
}

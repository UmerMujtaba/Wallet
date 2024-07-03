// auth_service.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  static Future<UserModel?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        // The user canceled the sign-in
        return null;
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

      if (userCredential.user != null) {
        return UserModel(
          email: userCredential.user!.email ?? '',
          name: userCredential.user!.displayName ?? '',
        );
      } else {
        return null;
      }

    } on Exception catch (e) {
      print('Exception->$e');
      return null;
    }
  }
}

class UserModel {
  final String email;
  final String name;

  UserModel({
    required this.email,
    required this.name,
  });
}

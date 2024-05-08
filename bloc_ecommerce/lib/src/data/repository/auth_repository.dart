import 'package:bloc_ecommerce/src/data/model/user_model.dart';
import 'package:bloc_ecommerce/src/data/preference/local_preference.dart';
import 'package:bloc_ecommerce/src/utils/asset_manager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignIn = await GoogleSignIn().signIn();

      if (googleSignIn == null) {
        debugPrint("user canceled the signin process. ");
        return null;
      }

      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignIn.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
      );

      final UserCredential authResult =
          await _auth.signInWithCredential(credential);

      if (authResult.user != null) {
        await createUserInDatabase(authResult.user!, null);
      }

      return authResult.user;
    } catch (e) {
      debugPrint("error singin in with google $e");
      return null;
    }
  }

  Future<User?> signInWithFacebook() async {
    try {
      final result = await FacebookAuth.instance.login();
      if (result.status == LoginStatus.success) {
        final credential =
            FacebookAuthProvider.credential(result.accessToken!.token);
        final UserCredential authResult =
            await FirebaseAuth.instance.signInWithCredential(credential);
        debugPrint("Facebook login success: ${authResult.user?.displayName}");
        return authResult.user;
      } else {
        debugPrint("Facebook login failed: ${result.message}");
        return null;
      }
    } catch (error) {
      debugPrint("Error signing in with Facebook: $error");
      return null;
    }
  }

  Future<void> createUserInDatabase(User user, String? username) async {
    final data = UserModel(
        userName: user.displayName ?? username,
        email: user.email,
        phone: user.phoneNumber,
        photoUrl: user.photoURL);
    try {
      await _firestore
          .collection('users')
          .doc(user.uid)
          .set(data.toJson())
          .then((value) =>
              debugPrint("Insert Your Data UserName:${user.displayName}"));

      LocalPreferences.setString(
          'username', user.displayName ?? username ?? '');
      LocalPreferences.setString('email', user.email ?? '');
      LocalPreferences.setString('phoneNumber', user.phoneNumber ?? '');
      LocalPreferences.setString('photoUrl',
          user.photoURL ?? AssetManager.Profile_Picture_Placeholder);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<User?> signUpWithEmail(
      String username, String email, String password) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      final user = credential.user;

      if (user != null) {
        await createUserInDatabase(user, username);
      }
      return user;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<User?> signInWithEmail(String email, String password) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      final user = userCredential.user;

      if (user?.email != null) {
        final UserModel userDetails = await getUserDetails(user?.email);
        LocalPreferences.setString('username', userDetails.userName ?? '');
        LocalPreferences.setString('email', userDetails.email ?? '');
        LocalPreferences.setString('phoneNumber', userDetails.phone ?? '');
        LocalPreferences.setString('photoUrl',
            userDetails.photoUrl ?? AssetManager.Profile_Picture_Placeholder);
      }

      return userCredential.user;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> signoutUser() async {
    await _auth.signOut();
  }

  Future<UserModel> getUserDetails(String? email) async {
    final snapshort = await _firestore
        .collection("users")
        .where("email", isEqualTo: email)
        .get();
    final userData =
        snapshort.docs.map((e) => UserModel.fromSnapshort(e)).single;
    return userData;
  }
}

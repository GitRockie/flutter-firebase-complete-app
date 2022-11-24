import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/firebase_ref/references.dart';
import 'package:flutter_application_1/screens/home/home_screen.dart';
import 'package:flutter_application_1/screens/login/login_screen.dart';
import 'package:flutter_application_1/widgets/dialogs/dialogue_widget.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../services/app_logger.dart';

class AuthController extends GetxController {
  @override
  void onReady() {
    //Here we enter navigation events, like snackbar, dialogs, or a new route, or async request.
    initAuth();
    super.onReady();
  }

  //Later initialization for _auth RX type since we're using Get X
  late FirebaseAuth _auth;
  final _user = Rxn<User>();
  //Creating User Stream, if logged or not
  late Stream<User?> _authStateChanges;

  void initAuth() async {
    await Future.delayed(const Duration(seconds: 2));
    _auth = FirebaseAuth.instance;
    _authStateChanges = _auth.authStateChanges();
    //listening event to the User changes passing User Object
    _authStateChanges.listen((User? user) {
      //saving the _user to the user value
      _user.value = user;
    });
    navigateToIntroduction();
  }

  //Google SignIn method
  Future<void> signInWithGoogle() async {
    final GoogleSignIn _googleSignIn = GoogleSignIn();
    try {
      GoogleSignInAccount? account = await _googleSignIn.signIn();
      //checking the account Object we created
      if (account != null) {
        final _authAccount = await account.authentication;
        final _credential = GoogleAuthProvider.credential(
            idToken: _authAccount.idToken,
            accessToken: _authAccount.accessToken);

        await _auth.signInWithCredential(_credential);
        await saveUser(account);
      }
    } on Exception catch (error) {
      AppLogger.i(error);
    }
  }

  //User method current user getting the value fron Firebase _auth instance
  User? getUser() {
    _user.value = _auth.currentUser;
    return _user.value;
  }

//keytool -list -v -keystore ~/.android/debug.keystore -alias androiddebugkey -storepass android -keypass android
//SHA 1 generated
  saveUser(GoogleSignInAccount account) {
    //SigIn the info to the Firebase in DB
    userRF.doc(account.email).set({
      'email': account.email,
      'name': account.displayName,
      'profilepic': account.photoUrl
    });
  }

  Future<void> signOut() async {
    AppLogger.d('SignOut');
    try {
      await _auth.signOut();
      navigateToHomeScreen();
    } on FirebaseAuthException catch (e) {
      AppLogger.w(e);
    }
  }

  void navigateToIntroduction() {
    Get.offAllNamed('/introduction');
  }

  void navigateToHomeScreen() {
    Get.offAllNamed(HomeScreen.routeName);
  }

  void showLoginAlertDialogue() {
    Get.dialog(Dialogues.questionStartDialogue(onTap: () {
      Get.back();
      //Navigate to login Page
      naviateToLoginScreen();
    }), barrierDismissible: false);
  }

  void naviateToLoginScreen() {
    Get.toNamed(LoginScreen.routeName);
  }

  //Check if User is Logged
  bool isLoggedIn() {
    return _auth.currentUser != null;
  }
}

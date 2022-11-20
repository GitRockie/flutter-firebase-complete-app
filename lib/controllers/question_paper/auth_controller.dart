import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

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

  void navigateToIntroduction() {
    Get.offAllNamed('/introduction');
  }
}

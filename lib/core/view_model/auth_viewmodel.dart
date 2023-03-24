import 'package:e_commerce/constance.dart';
import 'package:e_commerce/core/services/firestore_user.dart';
import 'package:e_commerce/model/user_model.dart';
import 'package:e_commerce/view/control_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import '../../helper/local_storage_data.dart';

class AuthViewModel extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  final FacebookAuth _facebookAuth = FacebookAuth.instance;

  final Rx<User?> _user = Rx<User?>(null);
  String? get user => _user.value?.email;

  late String name, email, password;

  final LocalStorageData controller = Get.find();

  @override
  void onInit() {
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
  }

  void googleSignIn() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication authToken = await googleUser!.authentication;

    final AuthCredential usercredential = GoogleAuthProvider.credential(
        idToken: authToken.idToken, accessToken: authToken.accessToken);

    await _auth.signInWithCredential(usercredential).then((user) async {
      await saveusertofirestore(user);
    });
  }

  void facebookSignIn() async {
    LoginResult loginResult = await _facebookAuth.login(permissions: ['email']);

    final accessToken = loginResult.accessToken!.token;

    final userCredintial = FacebookAuthProvider.credential(accessToken);
    await _auth.signInWithCredential(userCredintial).then((user) async {
      await saveusertofirestore(user);
    });
  }

  void emailPasswordSignIn() async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        await FirestoreUser().currentUser(value.user!.uid).then((value) async {
          await controller.setUser(
              UserModel.fromJson(value.data() as Map<String, dynamic>));
        });
      });
    } catch (e) {
      Get.snackbar('error massege', '$e');
    }
  }

  void ceateAccountWithemailAndPassword() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) async {
        saveusertofirestore(user);
        if (user.user!.emailVerified == false) {
          await _auth.currentUser!.sendEmailVerification();
          Get.snackbar('verify you email',
              'please go to your account and verify it before login',
              backgroundColor: primaryColor);
        }
      });

      Get.offAll(() => const ControlView());
    } catch (e) {
      Get.snackbar('error massege', '$e');
    }
  }

  saveusertofirestore(UserCredential user) async {
    UserModel model = UserModel(
        userId: user.user!.uid,
        email: user.user!.email,
        name: user.user!.displayName ?? name,
        picture: "");

    await FirestoreUser().addUserToFirestoe(model);

    await setUserInShared(model);
  }

  setUserInShared(UserModel model) async {
    await controller.setUser(model);
  }
}

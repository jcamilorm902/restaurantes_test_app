import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:restaurantes_test_app/utils/CustomException.dart';

class GlobalProvider with ChangeNotifier {
  final FirebaseAuth auth = FirebaseAuth.instance;
  User _loggedUser;

  User get loggedUser => _loggedUser;

  bool get isLoggedUser => _loggedUser != null;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Future<void> registerUser(String email, String password) async {
    try {
      UserCredential credential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      _loggedUser = credential.user;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw CustomException('La password ingresada es muy debil.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException('El correo electrónico ya está en uso.');
      }
      print(e);
      throw CustomException('Algo no anda bien. Intenta mas tarde.');
    } catch (e) {
      print(e);
      throw CustomException('Algo no anda bien. Intenta mas tarde.');
    }
  }

  Future<void> login(String email, String password) async {
    try {
      UserCredential credential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      _loggedUser = credential.user;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw CustomException('Usuario no encontrado.');
      } else if (e.code == 'wrong-password') {
        throw CustomException('Password incorrecto.');
      }
      print(e);
      throw CustomException('Algo no anda bien. Intenta mas tarde.');
    } catch (e) {
      print(e);
      throw CustomException('Algo no anda bien. Intenta mas tarde.');
    }
  }

  Future<void> logout() async {
    await auth.signOut();
    _loggedUser = null;
    notifyListeners();
  }
}

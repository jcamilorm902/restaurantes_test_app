import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

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
        throw Exception('La password ingresada es muy debil.');
      } else if (e.code == 'email-already-in-use') {
        throw Exception('El correo electrónico ya está en uso.');
      }
      print(e);
      throw Exception('Algo no anda bien. Intenta mas tarde.');
    } catch (e) {
      print(e);
      throw Exception('Algo no anda bien. Intenta mas tarde.');
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
        throw Exception('Usuario no encontrado.');
      } else if (e.code == 'wrong-password') {
        throw Exception('Password incorrecto.');
      }
      print(e);
      throw Exception('Algo no anda bien. Intenta mas tarde.');
    } catch (e) {
      print(e);
      throw Exception('Algo no anda bien. Intenta mas tarde.');
    }
  }

  Future<void> logout() async {
    await auth.signOut();
    _loggedUser = null;
    notifyListeners();
  }
}

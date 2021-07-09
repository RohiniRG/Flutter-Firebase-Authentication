import 'package:firebase_auth/firebase_auth.dart';
import 'package:project/Models/usermodel.dart';

class AuthService {
  // private property: _auth: only valid in this file
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user object based on uid
  User _userFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  // Auth change user stream
  // Strean to get information of each user to tell if user is signedin/out
  Stream<User> get user {
    // return _auth.onAuthStateChanged.map((FirebaseUser user) => _userFirebaseUser(user));
    // Same cam be written as
    return _auth.onAuthStateChanged.map(_userFirebaseUser);
  }

  // sign-in anon
  Future signInAnon() async {
    try {
      // returns an auth result
      AuthResult res = await _auth.signInAnonymously();
      FirebaseUser user = res.user;
      return _userFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign-in with email/pd
  Future signinWithEPD(String email, String pd) async {
    try {
      AuthResult res =
          await _auth.signInWithEmailAndPassword(email: email, password: pd);
      FirebaseUser user = res.user;
      return _userFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // register with email/pd
  Future registerWithEPD(String email, String pd) async {
    try {
      AuthResult res = await _auth.createUserWithEmailAndPassword(
          email: email, password: pd);
      FirebaseUser user = res.user;
      return _userFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign-out method
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}

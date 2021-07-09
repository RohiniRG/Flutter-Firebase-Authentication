import 'package:flutter/material.dart';
import 'package:project/Models/usermodel.dart';
import 'package:project/Pages/Home/home.dart';
import 'package:project/Pages/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project/Services/auth.dart';
import 'package:provider/provider.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // await .initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: missing_required_param
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
      home: Wrapper(),
      // home: Home(),
      ),
    );
  }
}

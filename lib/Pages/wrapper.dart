import 'package:flutter/material.dart';
import 'package:project/Pages/Authenticate/authenticate.dart';
import 'package:project/Pages/Home/home.dart';
import 'package:provider/provider.dart';
import 'package:project/Models/usermodel.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Based on signin status
    final user = Provider.of<User>(context);
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}

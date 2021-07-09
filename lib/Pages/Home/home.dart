import 'package:flutter/material.dart';
import 'package:project/Services/auth.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: new Color(0xffffe5b4),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 100.0, horizontal: 50.0),
        child: Form(
          child: Column(
            children: [
              SizedBox(
                height: 15.0,
              ),
              Text(
                'Authentication Successful!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.red[900],
                  fontFamily: 'CarterOne',
                  fontSize: 41,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                '\nWe have a million things in store for you!\n\nJust you wait!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.red[900],
                  fontSize: 30.0,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              ElevatedButton(
                  child: Padding(
                    padding:
                        const EdgeInsets.fromLTRB(25.0, 15.0, 25.0, 15.0),
                    child: Text(
                      'Log out :(',
                      style: TextStyle(color: Colors.white, fontSize: 30.0),
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.red[900]),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(26.0)),
                            side: BorderSide(color: Colors.red))),
                  ),
                  onPressed: () async {
                    await _auth.signOut();
                  },
                  ),
                SizedBox(height: 12.0,),
            ],
          ),
        )),
        );
  }
}

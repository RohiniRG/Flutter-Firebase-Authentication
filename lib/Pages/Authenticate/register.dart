import 'package:flutter/material.dart';
import 'package:project/Services/auth.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: new Color(0xffffe5b4),
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: new Color(0xffffe5b4),
        elevation: 0.0,
        actions: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 10.0, 5.0, 10.0),
                child: TextButton(
                  onPressed: () {
                    widget.toggleView();
                  },
                  child: const Text('Sign in'),
                  style: TextButton.styleFrom(
                      textStyle:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      primary: Colors.red[900]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(2.0, 13.0, 13.0, 13.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.red[200],
                      borderRadius: BorderRadius.circular(12.0)),
                  child: TextButton(
                    onPressed: () {},
                    child: const Text('Sign up'),
                    style: TextButton.styleFrom(
                        textStyle: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                        primary: Colors.red[900]),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  'Welcome, guest!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.red[900],
                    fontFamily: 'CarterOne',
                    fontSize: 39.5,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Sign up to get started...',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.red[900],
                    fontSize: 29.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                TextFormField(
                  validator: (value) => value.isEmpty ? 'Enter a email!' : null,
                  decoration: InputDecoration(
                    hintText: 'Enter Your Email...',
                    prefixIcon: Icon(Icons.email_outlined),
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 18.0),
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                      borderSide: BorderSide(color: Colors.red[900], width: 5),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                      borderSide: BorderSide(color: Colors.red[900], width: 5),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                      borderSide: BorderSide(color: Colors.red[900], width: 5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                      borderSide: BorderSide(color: Colors.red[900], width: 5),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() => email = value);
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  validator: (value) => value.length < 6
                      ? 'Enter password of 6+ chars long!'
                      : null,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Enter Your Password...',
                    prefixIcon: Icon(Icons.lock_open_outlined),
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 18.0),
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                      borderSide: BorderSide(color: Colors.red[900], width: 5),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                      borderSide: BorderSide(color: Colors.red[900], width: 5),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                      borderSide: BorderSide(color: Colors.red[900], width: 5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                      borderSide: BorderSide(color: Colors.red[900], width: 5),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() => password = value);
                  },
                ),
                SizedBox(
                  height: 40.0,
                ),
                ElevatedButton(
                    child: Padding(
                      padding:
                          const EdgeInsets.fromLTRB(25.0, 15.0, 25.0, 15.0),
                      child: Text(
                        'Register!',
                        style: TextStyle(color: Colors.white, fontSize: 25.0),
                      ),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        dynamic res =
                            await _auth.registerWithEPD(email, password);
                        if (res == null) {
                          AlertDialog(
                              title: const Text('AlertDialog Title'),
                              content: const Text('AlertDialog description'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'Cancel'),
                                  child: const Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                  child: const Text('OK'),
                                ),
                              ],
                            );
                          setState(() => {
                            error = 'Account already exists!'
                          });
                        }
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.red[900]),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(26.0)),
                              side: BorderSide(color: Colors.red))),
                    )),
                  SizedBox(height: 12.0,),
                  Text(
                    error,
                    style: TextStyle(color: Colors.black, fontSize: 14.0),
                  )
              ],
            ),
          )),
    );
  }
}

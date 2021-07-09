import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.orange[800],
      ),
      body: Column(
        children: [
          Container(
            height: size.height * 0.3,
            decoration: BoxDecoration(
              color: Colors.orange[800],
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(80),
                bottomRight: Radius.circular(80),
              ),
            ),
            child: Row(
              children: [
                Text(
                  'Welcome',
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.white,
                  ),
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

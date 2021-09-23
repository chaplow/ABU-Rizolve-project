import 'package:abu_rizolve/views/signuplogin/anonsSignIn.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:abu_rizolve/additional/icons.dart';
import 'package:abu_rizolve/views/signuplogin/AdminSignIn.dart';
import 'package:abu_rizolve/views/signuplogin/StudentSignIn.dart';

class SignInOption extends StatefulWidget {
  final AssetImage bImage;

  SignInOption(this.bImage);

  @override
  _SignInOptionState createState() => _SignInOptionState();
}

class _SignInOptionState extends State<SignInOption> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: widget.bImage,
          fit: BoxFit.cover,
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Center(
        child: Container(
            width: 300,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20.0,
                ),
                Card(
                  elevation: 2,
                  color: Colors.white.withOpacity(0.6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: ListTile(
                    title: Text(
                      "Sign In as a Student",
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return StudentSignIn();
                      }));
                    },
                    trailing:
                        Icon(MyFlutterApp.signinicon, color: Colors.black),
                  ),
                ),
                // SizedBox(
                //   height: 20.0,
                // ),

                // Card(
                //   color: Colors.blue[200].withOpacity(0.6),
                //   elevation: 2,
                //   shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.all(Radius.circular(20)),
                //   ),
                //   child: ListTile(
                //     title: Text(
                //       "Sign In as a Warden",
                //       style: TextStyle(
                //           color: Colors.white, fontWeight: FontWeight.bold),
                //     ),
                //     onTap: () {
                //       Navigator.push(context,
                //           MaterialPageRoute(builder: (context) {
                //         return WardenSignIn();
                //       }));
                //     },
                //     trailing: Icon(
                //       MyFlutterApp.wardenicon,
                //       color: Colors.black,
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: 20.0,
                ),
                Card(
                  elevation: 2,
                  color: Colors.white.withOpacity(0.6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: ListTile(
                    title: Text(
                      "Sign In as a Admin",
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return AdminSignIn();
                      }));
                    },
                    trailing: Icon(MyFlutterApp.adminicon, color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),

                Card(
                  elevation: 2,
                  color: Colors.blue[100].withOpacity(0.6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: ListTile(
                    title: Text("Sign in Anonymous",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        )),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return AnonSignUp();
                      }));
                    },
                    trailing:
                        Icon(MyFlutterApp.signupicon, color: Colors.black),
                  ),
                ),
              ],
            )),
      ),
    ));
  }
}

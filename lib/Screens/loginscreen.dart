// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:note/Screens/homescreen.dart';
import 'package:note/Screens/registration.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController emailcontroller = new TextEditingController();
  final TextEditingController passcontroller = new TextEditingController();

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final emailfield = TextFormField(
      autofocus: false,
      controller: emailcontroller,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter Email");
        }
      },
      onSaved: (value) {
        emailcontroller.text = value!;
      },
      style: TextStyle(fontFamily: "Sans", fontSize: 20),
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail_outline_rounded),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 00, 15),
          hintText: "Email",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
    );

    final passfield = TextFormField(
      autofocus: false,
      controller: passcontroller,
      keyboardType: TextInputType.visiblePassword,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter Pass");
        }
      },
      onSaved: (value) {
        emailcontroller.text = value!;
      },
      style: TextStyle(fontFamily: "Sans", fontSize: 20),
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail_outline_rounded),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
    );

    final loginbutton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(20),
      color: Colors.red,
      child: MaterialButton(
        onPressed: () {
          signin(emailcontroller.text, passcontroller.text);
        },
        child: Text(
          "Login",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontFamily: "Sans",
              fontWeight: FontWeight.bold),
        ),
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width / 1.1,
      ),
    );

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
            child: Container(
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  emailfield,
                  SizedBox(
                    height: 20,
                    width: 20,
                  ),
                  passfield,
                  SizedBox(
                    height: 50,
                    width: 20,
                  ),
                  loginbutton,
                  SizedBox(
                    height: 20,
                    width: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Dont have an account?"),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegistrationScreen()));
                        },
                        child: Text(
                          "Sign up",
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }

  void signin(String email, String Password) async {
    if (_formkey.currentState!.validate()) {
      await _auth
          .signInWithEmailAndPassword(email: email, password: Password)
          .then((uid) => {
                Fluttertoast.showToast(msg: "Login Successful"),
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => HomeScreen()))
              })
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }
}

// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:note/Screens/loginscreen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formkey = GlobalKey<FormState>();

  final firstnamecontroller = new TextEditingController();
  final Lastnamecontroller = new TextEditingController();
  final emailcontroller = new TextEditingController();
  final passwordcontroller = new TextEditingController();
  final confirmpasscontroller = new TextEditingController();

  @override
  Widget build(BuildContext context) {


    final namefield = TextFormField(
      autofocus: false,
      controller: firstnamecontroller,
      keyboardType: TextInputType.name,
      //  validator:(){},
      onSaved: (value) {
        firstnamecontroller.text = value!;
      },
      style: TextStyle(fontFamily: "Sans", fontSize: 20),
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.person),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 00, 15),
          hintText: "First name",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
    );

    final lastfield = TextFormField(
      autofocus: false,
      controller: Lastnamecontroller,
      keyboardType: TextInputType.name,
      //  validator:(){},
      onSaved: (value) {
        Lastnamecontroller.text = value!;
      },
      style: TextStyle(fontFamily: "Sans", fontSize: 20),
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.person),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 00, 15),
          hintText: "Last name",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
    );

    final emailfield = TextFormField(
        autofocus: false,
        controller: emailcontroller,
        keyboardType: TextInputType.emailAddress,
        //validato:(){},
        onSaved: (value) {
          emailcontroller.text = value!;
        },
        style: TextStyle(fontFamily: "Sans", fontSize: 20),
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.mail),
            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: "Email",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30))));

    final passfield = TextFormField(
        autofocus: false,
        controller: passwordcontroller,
        keyboardType: TextInputType.visiblePassword,
        //validato:(){},
        onSaved: (value) {
          passwordcontroller.text = value!;
        },
        style: TextStyle(fontFamily: "Sans", fontSize: 20),
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.security_outlined),
            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: "Password",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30))));

    final confirmpassfield = TextFormField(
        autofocus: false,
        controller: confirmpasscontroller,
        keyboardType: TextInputType.visiblePassword,
        //validato:(){},
        onSaved: (value) {
          confirmpasscontroller.text = value!;
        },
        style: TextStyle(fontFamily: "Sans", fontSize: 20),
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.security_outlined),
            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: "Confirm Password",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30))));


                final signup = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(20),
      color: Colors.red,
      child: MaterialButton(
        onPressed: () {},
        child: Text(
          "Signup",
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
                  namefield,
                  SizedBox(
                    height: 20,
                    width: 20,
                  ),
                  lastfield,
                  SizedBox(
                    height: 20,
                    width: 20,
                  ),
                  emailfield,
                  SizedBox(
                    height: 20,
                    width: 20,
                  ),
                  passfield,
                  SizedBox(
                    height: 20,
                    width: 20,
                  ),
                  confirmpassfield,
                  SizedBox(
                    height: 20,
                    width: 20,
                  ),
                  signup,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Have an account?"),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        },
                        child: Text(
                          "Login",
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
}

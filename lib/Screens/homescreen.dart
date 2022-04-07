import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final loginout = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(20),
      color: Colors.red,
      child: MaterialButton(
        onPressed: () {},
        child: Text(
          "Log Out",
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

    return Scaffold(body: Center(child: SingleChildScrollView(child: Container(child: loginout,)),));
    
  }
}

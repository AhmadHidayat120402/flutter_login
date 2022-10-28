import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'show.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Aplikasi Form"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 5),
          Text("Formulir pendataan"),
          Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                  decoration: InputDecoration(
                      hintText: "input your email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )))),
          Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: "input your password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )))),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text("LOGIN"),
          ),
          SizedBox(
            height:5),
        
        ],
      ),
    );
  }
}

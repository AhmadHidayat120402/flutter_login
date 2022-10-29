import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:login2/home_page.dart';
import 'show.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  registerSubmit() async{
    try{
      await _firebaseAuth.createUserWithEmailAndPassword(email: _emailController.text.toString().trim(), password: _passwordController.text);
    }catch (e){
      print(e);
      SnackBar(content: Text(e.toString()));
    }

  }

  loginSubmit() async{
    try{
      _firebaseAuth.signInWithEmailAndPassword(email: _emailController.text, password: _passwordController.text).then((value) => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage())));
    } catch (e){
      print(e);
      SnackBar(content: Text(e.toString()));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Latihan Form"),
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
              padding: const EdgeInsets.all(10),
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
            onPressed: () {loginSubmit();},
            child: Text("LOGIN"),
          ),
          SizedBox(
            height:5),
      TextButton(onPressed: (){registerSubmit();}, child: Text("Jika belum memiliki akun silahkah"))
        ],
      ),
    );
  }
}

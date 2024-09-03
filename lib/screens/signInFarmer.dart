import 'package:farmlink/screens/signUpFarmer.dart';
import 'package:flutter/material.dart';

import 'mongodb.dart';

class signInFarmer extends StatefulWidget {
  const signInFarmer({super.key});

  @override
  State<signInFarmer> createState() => _signInFarmerState();
}

class _signInFarmerState extends State<signInFarmer> {
  late String getEmail, getPass;
  late String email;
  late String pass;
  Future<void> setText() async {
    setState(() {
      email = getEmail;
      pass = getPass;
    });
    bool test = await mongodb.emailExistsFarmer(email);
    if(test == false) {
      print("This works");
      //TODO SHOW A SNACKBAR SAYING CANT LOG IN HERE
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Sign in as Farmer'),
          backgroundColor: Colors.green,
        ),
        body: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Sign in to FarmLink as Farmer'),
              TextField(
                onChanged: (value) => getEmail = value,
                decoration: InputDecoration(
                  hintText: 'Enter email',
                ),
              ),
              TextField(
                onChanged: (value) => getPass = value,
                decoration: InputDecoration(
                  hintText: 'Enter password',
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const signUpFarmer()));
                      },
                      child: Text('Sign Up!')),
                  ElevatedButton(onPressed: setText, child: Text('Login')),
                ],
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Go Back!')),
            ],
          ),
        ));
  }
}

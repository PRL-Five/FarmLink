import 'package:farmlink/screens/signUpFarmer.dart';
import 'package:flutter/material.dart';

import 'homeFarmer.dart';
import 'mongodb.dart';

class signInFarmer extends StatefulWidget {
  const signInFarmer({super.key});

  @override
  State<signInFarmer> createState() => _signInFarmerState();
}

class _signInFarmerState extends State<signInFarmer> {
  late String getEmail, getPass,getAlert = '';
  late String email;
  late String pass;
  late String alert = '';
  Future<void> setText() async {
    setState(() {
      email = getEmail;
      pass = getPass;
      alert = getAlert;
    });
    bool emailSt = await mongodb.emailExistsFarmer(email);
    bool passSt = await mongodb.passwordExistsFarmer(pass);
    if(emailSt == false) {
      getAlert = 'email does not exist. Create a free account using the sign up button';
      setState(() {
        alert = getAlert;
      });
    }
    else if(emailSt == true && passSt == false) {
      getAlert = 'incorrect password';
      setState(() {
        alert = getAlert;
      });
    }
    else {
      Navigator.push(context,
          MaterialPageRoute(
              builder: (context) => const homeFarmer()));
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
              Text(
                alert,
                style: TextStyle(
                  color: Colors.red,
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

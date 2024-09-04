// ignore_for_file: camel_case_types, file_names

import 'package:farmlink/screens/homeConsumer.dart';
import 'package:farmlink/screens/signUpConsumer.dart';
import 'package:flutter/material.dart';
import 'mongodb.dart';
typedef dict = Map<String, dynamic>;
class signInConsumer extends StatefulWidget {
  const signInConsumer({super.key});

  @override
  State<signInConsumer> createState() => _signInConsumerState();
}

class _signInConsumerState extends State<signInConsumer> {
  final getText = TextEditingController();
  late String getEmail, getPass,getAlert = '';
  late String email;
  late String pass;
  late String alert = '';
  Future<void> setText() async {
    setState(() {
      email = getEmail;
      pass = getPass;
    });
    bool isEmail = await mongodb.emailExistsUser(email);
    bool isPassword = await mongodb.passwordExistsUser(pass);
    if(isEmail == false) {
      getAlert = "Account does not exist";
      setState(() {
        alert = getAlert;
      });
    }
    else if(isEmail == true && isPassword == false) {
      getAlert = "incorrect password";
      setState(() {
        alert = getAlert;
      });
    }
    else {

        print('Inside context.mounted');
        Navigator.push(context,
            MaterialPageRoute(
                builder: (context) => const homeConsumer()));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Sign in as Consumer'),
          backgroundColor: Colors.green,
        ),
        body: Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Sign in to FarmLink as Consumer'),
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
          Text(alert),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const signUpConsumer()));
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

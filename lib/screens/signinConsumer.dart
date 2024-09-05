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
  bool checker = false;
  late String getEmail = '', getPass = '',getAlert = '';
  late String email;
  late String pass;
  late String alert = '';
  Future<void> setText() async {
    setState(() {
      checker = true;
      email = getEmail;
      pass = getPass;
    });
    bool isEmail = await mongodb.emailExistsUser(email);
    bool isPassword = await mongodb.passwordExistsUser(pass);
    if(isEmail == false) {
      getAlert = "Account does not exist";
      setState(() {
        checker = false;
        alert = getAlert;
      });
    }
    else if(isEmail == true && isPassword == false) {
      getAlert = "incorrect password";
      setState(() {
        checker = false;
        alert = getAlert;
      });
    }
    else {
        setState(() {
          checker = false;
        });
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
          title: const Text('Sign in as Consumer'),
          backgroundColor: Colors.green,
        ),
        body: Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Sign in to FarmLink as Consumer'),
          TextField(
            onChanged: (value) => getEmail = value,
            decoration: const InputDecoration(
              hintText: 'Enter email',
            ),
          ),
          TextField(
            onChanged: (value) => getPass = value,
            decoration: const InputDecoration(
              hintText: 'Enter password',
            ),
          ),
          Visibility(
              visible: checker,
              child: const CircularProgressIndicator(
                color: Colors.green,
                strokeWidth: 1.5,
              )
          ),
          Text(alert,style: const TextStyle(color: Colors.red),),
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
                  child: const Text('Sign Up!')),
              ElevatedButton(onPressed: setText, child: Text('Login')),
            ],
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Go Back!')),
        ],
      ),
    ));
  }
}

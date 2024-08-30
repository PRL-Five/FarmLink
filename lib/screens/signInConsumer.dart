import 'package:flutter/material.dart';
class signInConsumer extends StatefulWidget {
  const signInConsumer({super.key});

  @override
  State<signInConsumer> createState() => _signInConsumerState();
}

class _signInConsumerState extends State<signInConsumer> {
  final getText = TextEditingController();
  late String getEmail,getPass;
  late String email;
  late String pass;
  void setText() {
    setState(() {
      email = getEmail;
      pass = getPass;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: setText, child: Text('Sign Up!')),
                  ElevatedButton(onPressed: setText, child: Text('Login')),
                ],
              ),
              ElevatedButton(onPressed: () {
                Navigator.pop(context);
              },
                  child: Text('Go Back!')
              ),

            ],
          ),
        )
    );
  }
}

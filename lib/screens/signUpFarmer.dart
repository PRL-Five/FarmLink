import 'package:flutter/material.dart';

class signUpFarmer extends StatefulWidget {
  const signUpFarmer({super.key});

  @override
  State<signUpFarmer> createState() => _signUpFarmerState();
}

class _signUpFarmerState extends State<signUpFarmer> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12 ),
                child: Text(
                  'Sign up to FarmLink with a free account, today.',
                  style: TextStyle(
                    fontSize: 25,

                  ),
                ),
              ),
            ],
          )
      ),
    );
  }
}

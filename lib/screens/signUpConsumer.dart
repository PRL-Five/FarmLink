// ignore_for_file: unused_field, camel_case_types

import 'package:farmlink/screens/homeConsumer.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'mongodb.dart';
typedef dict = Map<String, dynamic>;
class signUpConsumer extends StatefulWidget {
  const signUpConsumer({super.key});

  @override
  State<signUpConsumer> createState() => _signUpConsumerState();
}

class _signUpConsumerState extends State<signUpConsumer> {
  final formKey = GlobalKey<FormState>();
  late String fullName,
      farmerId,
      email,
      password,
      confirmPassword,
      mobileNumber;
  bool _termsAccepted = false;
  dict throwData() {
    dict ans = {
      "fullName" : fullName,
      "email" : email,
      "password" : password,
      "mobile" : mobileNumber,
    };
    return ans;
  }
  void _signUp() {
    if (formKey.currentState!.validate() && _termsAccepted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Sign-up successful')),
      );
    } else if (!_termsAccepted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('You must accept the terms and conditions')),
      );
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => homeConsumer()),
    );
    dict sendToDb = throwData();
    mongodb.insert(sendToDb);
  }

  void _openTermsAndConditions() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TermsAndConditionsPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up as Customer'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'Full Name'),
                  onChanged: (value) => fullName = value,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your full name';
                    }
                    return null;
                  },
                ),
                // TextFormField(
                //   decoration: InputDecoration(labelText: 'Farmer ID'),
                //   onChanged: (value) => _farmerId = value,
                //   validator: (value) {
                //     if (value == null || value.isEmpty) {
                //       return 'Please enter your Farmer ID';
                //     }
                //     return null;
                //   },
                // ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Email Address'),
                  onChanged: (value) => email = value,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email address';
                    }
                    if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  onChanged: (value) => password = value,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Confirm Password'),
                  obscureText: true,
                  onChanged: (value) => confirmPassword = value,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    }
                    if (value != password) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Mobile Number'),
                  onChanged: (value) => mobileNumber = value,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your mobile number';
                    }
                    return null;
                  },
                ),
                Row(
                  children: [
                    Checkbox(
                      value: _termsAccepted,
                      onChanged: (bool? value) {
                        setState(() {
                          _termsAccepted = value ?? false;
                        });
                      },
                    ),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'I accept the ',
                              style: TextStyle(color: Colors.black),
                            ),
                            TextSpan(
                              text: 'terms and conditions',
                              style: TextStyle(color: Colors.blue),
                              recognizer: TapGestureRecognizer()
                                ..onTap = _openTermsAndConditions,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _signUp,
                  child: Text('Sign Up'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Back to Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Dummy Terms and Conditions Page
class TermsAndConditionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Terms and Conditions'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Text('Terms and Conditions content goes here'),
      ),
    );
  }
}

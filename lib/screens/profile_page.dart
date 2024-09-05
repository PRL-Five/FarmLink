import 'package:flutter/material.dart';
import 'mongodb.dart';
typedef dict = Map<String, dynamic>;
class ProfilePage extends StatefulWidget {
  final String fullName,password,mobile,email;
  const ProfilePage({super.key,required this.fullName, required this.password, required this.mobile, required this.email});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    String fullName = widget.fullName;
    String password = widget.password;
    String email = widget.email;
    String mobile = widget.mobile;
    return  Scaffold(
      appBar: AppBar(
        title: Text('Hello '+fullName)
      ),
      body: Center(child: Text('Name:'+fullName+'\nPass:'+password+'\nEmail:'+email+'\nmobile:'+mobile),),

    );
  }
}

import 'package:flutter/material.dart';
class homeFarmer extends StatefulWidget {
  const homeFarmer({super.key});

  @override
  State<homeFarmer> createState() => _homeFarmerState();
}

class _homeFarmerState extends State<homeFarmer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page for Farmer"),
      ),
    );
  }
}

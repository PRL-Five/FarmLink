import 'package:farmlink/screens/mongodb.dart';
import 'package:flutter/material.dart';
import 'package:farmlink/screens/signin.dart';// Ensure this path is correct

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await mongodb.connect();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(), // Use Home widget directly
      theme: ThemeData(primarySwatch: Colors.green),
    );
  }
}

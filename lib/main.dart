import 'package:farmlink/screens/mongodb.dart';
import 'package:flutter/material.dart';
import 'package:farmlink/screens/signin.dart';
import 'package:farmlink/models/cart.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await mongodb.connect();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Cart(),
      builder: (context, child) => const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home(), // Use Home widget directly
      ),
    );
  }
}

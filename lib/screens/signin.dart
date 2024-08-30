import 'package:farmlink/screens/signInConsumer.dart';
import 'package:flutter/material.dart';
import 'package:farmlink/screens/signInFarmer.dart';
Builder body(BuildContext context) {
  return Builder(
    builder: (context) => Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Welcome to farmlink\nWhat is your business?',
          style: TextStyle(
            fontSize: 25,
          ),

        ),
        SizedBox(height: 50,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const signInFarmer()),
                );},
              child: Text('Consumer'),
            ),
            ElevatedButton(
              onPressed:  () {
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const signInConsumer()),
              );},
              child: Text('Farmer'),
            ),
          ],
        )

      ],
    ),
  );
}
Widget home(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.lightGreen,
    body: body(context),
  );
}
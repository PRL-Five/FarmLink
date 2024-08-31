import 'package:flutter/material.dart';
import 'package:farmlink/screens/signInConsumer.dart';
import 'package:farmlink/screens/signInFarmer.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // // Display the logo image
            // Image.asset(
            //   'assets/icon/app-icon.jpg', // Updated path to your logo image
            //   width: 150, // Adjust width as needed
            //   height: 150, // Adjust height as needed
            //   fit: BoxFit.cover,
            //   errorBuilder: (context, error, stackTrace) {
            //     return Text(
            //       'Image not found!',
            //       style: TextStyle(color: Colors.red, fontSize: 20),
            //     );
            //   },
            // ),
            // SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Welcome to FarmLink!\n\n'
                'Are you a Farmer or a Consumer?',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  letterSpacing: 1.2,
                  height: 1.4,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 40),
            Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const signInFarmer()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      textStyle: TextStyle(fontSize: 22),
                    ),
                    child: Text(
                      'Farmer',
                      style: TextStyle(color: Colors.blueGrey),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const signInConsumer()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      textStyle: TextStyle(fontSize: 22),
                    ),
                    child: Text(
                      'Consumer',
                      style: TextStyle(color: Colors.blueGrey),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

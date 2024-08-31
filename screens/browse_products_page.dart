import 'package:flutter/material.dart';

class BrowseProductsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Browse Products'),
      ),
      body: Center(
        child: Text('List of Products'),
      ),
    );
  }
}

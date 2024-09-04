import 'package:farmlink/components/cart_item.dart';
import 'package:farmlink/models/cart.dart';
import 'package:farmlink/models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CusCartPage extends StatelessWidget {
  const CusCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // heading
            const Center(
              child: Text(
                'My Cart',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: value.getUserCart().length,
                itemBuilder: (context, index) {
                  // get individual product
                  Product individualProduct = value.getUserCart()[index];
            
                  // return the cart item
                  return CartItem(product: individualProduct);
                },
              ),
            ),

            /* */
          ],
        ),
      ),
    );
  }
}

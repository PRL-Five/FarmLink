// ignore_for_file: must_be_immutable

import 'package:farmlink/models/cart.dart';
import 'package:farmlink/models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItem extends StatefulWidget {
  Product product;
  CartItem({super.key, required this.product});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  // remove item from cart
  void removeItemFromCart() {
    Provider.of<Cart>(context, listen: false)
        .removeItemFromCart(widget.product);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: ListTile(
          leading: Image.asset(widget.product.imagePath),
          title: Text(widget.product.name),
          subtitle: Text(widget.product.price),
          trailing: Column(
            children: [
              // IconButton(onPressed: , icon: Icon(Icons.add)),
              IconButton(
                  onPressed: removeItemFromCart, icon: Icon(Icons.delete)),
            ],
          ),
        ),
      ),
    );
  }
}

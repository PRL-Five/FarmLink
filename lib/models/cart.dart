import 'package:farmlink/models/product.dart';
import 'package:flutter/material.dart';

class Cart extends ChangeNotifier {
  // list of products for sale

  List<Product> productShop = [
    Product(
      name: 'Cabbage',
      price: '199',
      description: 'Any description of products\nAny description of products',
      imagePath: 'lib/assets/cabbage.jpg',
    ),
    Product(
      name: 'Corn',
      price: '100',
      description: 'Any description of products\nAny description of products',
      imagePath: 'lib/assets/corn.webp',
    ),
    Product(
      name: 'Rice',
      price: '400',
      description: 'Any description of products\nAny description of products',
      imagePath: 'lib/assets/rice.jpg',
    ),
    Product(
      name: 'Brinjal',
      price: '88',
      description:
          'Any description of products.Any description of products.This is Fresh and good brinjals without any pestisides',
      imagePath: 'lib/assets/brinjal.jpeg',
    ),
  ];

  // list of items in user cart
  List<Product> userCart = [];

  // get list of products for sale
  List<Product> getProductList() {
    return productShop;
  }

  // get cart
  List<Product> getUserCart() {
    return userCart;
  }

  // add item to cart
  void addItemToCart(Product product) {
    userCart.add(product);
    notifyListeners();
  }

  // remove item from cart
  void removeItemFromCart(Product product) {
    userCart.remove(product);
    notifyListeners();
  }
}

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:farmlink/models/cart.dart';
import 'package:farmlink/models/prduct_tile.dart';
import 'package:farmlink/models/product.dart';
import 'package:farmlink/screens/cus_fav_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CusShopPage extends StatefulWidget {
  const CusShopPage({super.key});

  @override
  State<CusShopPage> createState() => _CusShopPageState();
}

class _CusShopPageState extends State<CusShopPage> {
  // add product to cart
  void addProductToCart(Product product) {
    Provider.of<Cart>(context, listen: false).addItemToCart(product);
    // alert the user, product successfully added
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Successfully added!'),
        content: Text('Check your cart'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Column(
        children: [
          // search bar
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      CusFavPage(), // later change to search page
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.symmetric(horizontal: 25),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Search',
                    // style: TextStyle(color: Colors.white),
                  ),
                  Icon(
                    Icons.search,
                    // color: Colors.green,
                  ),
                ],
              ),
            ),
          ),

          // message
          Padding(
            padding: EdgeInsets.symmetric(vertical: 25.0),
            child: Text(
              'Straight from the field to your door',
              style: TextStyle(
                  //color: Colors.green[200]
                  color: Colors.grey[600]),
            ),
          ),

          // suggestions of produts

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Suggestions🐣',
                  style: TextStyle(
                      //color: Colors.green[800],
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          CusFavPage(), // Later chage to product list page
                    ),
                  ),
                  child: Text(
                    "See all",
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),

          // list of products for sale
          Expanded(
            child: ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                // get a product from shop list
                Product product = value.getProductList()[index];

                // return the product
                return ProductTile(
                  product: product,
                  onTap: () => addProductToCart(product),
                );
              },
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: 70.0, left: 25.0, right: 25.0),
          ),

          /* */
        ],
      ),
    );
  }
}

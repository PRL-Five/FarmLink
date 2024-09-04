import 'package:farmlink/models/product.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProductTile extends StatelessWidget {
  Product product;
  void Function()? onTap;
  ProductTile({super.key, required this.product, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 25),
      width: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          // product pic
          Container(
            // margin: EdgeInsets.only(bottom: 10),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),

            width: 300,
            height: 240,
            // padding: EdgeInsets.symmetric(vertical: 10),
            padding: const EdgeInsets.only(
              left: 20,
              top: 15,
              right: 20,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                product.imagePath,
                fit: BoxFit.contain,
              ),
            ),
          ),

          const SizedBox(height: 15),

          // divider
          const Divider(
            color: Colors.grey,
            thickness: 1,
            height: 1,
          ),

          // description
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              product.description,
              style: TextStyle(color: Colors.grey[600]),
              maxLines: 2, // Limited the number of lines to 2
              overflow: TextOverflow.ellipsis, // Add "..." if text overflows
            ),
          ),

          // Spacer to push content to the bottom
          const Spacer(),

          // price + name + button
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // name
                    Text(
                      product.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const SizedBox(height: 5),
                    // price
                    Text(
                      '${product.price} ₹',
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),

                // plus button
                GestureDetector(
                  onTap: onTap,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../models/product.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(product.title),
          Text('\$${product.price.toStringAsFixed(2)}'),
          IconButton(
            icon: const Icon(Icons.add_shopping_cart),
            onPressed: () {
              Provider.of<CartProvider>(context, listen: false).addItem(
                product.id,
                product.title,
                product.price,
              );
            },
          ),
        ],
      ),
    );
  }
}

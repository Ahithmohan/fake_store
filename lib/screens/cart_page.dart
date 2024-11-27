import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      body: ListView.builder(
        itemCount: cart.cartItems.length,
        itemBuilder: (context, index) {
          final product = cart.cartItems[index];
          return ListTile(
            leading: Image.network(product.image.toString()),
            title: Text(product.title ?? "No Title"),
            subtitle: Text("\$${product.price}"),
          );
        },
      ),
    );
  }
}

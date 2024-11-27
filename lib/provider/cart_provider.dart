import 'package:fake_stroe/models/product_model.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final List<ProductModel> cartItems = [];

  void addToCart(ProductModel product) {
    cartItems.add(product);
    notifyListeners();
  }
}

import 'package:fake_stroe/models/product_model.dart';
import 'package:fake_stroe/provider/cart_provider.dart';
import 'package:fake_stroe/screens/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewPage extends StatefulWidget {
  final ProductModel products;
  const ViewPage({super.key, required this.products});

  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  final List<ProductModel> cartItems = [];
  void addToCart(ProductModel product) {
    setState(() {
      cartItems.add(product);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            height: 400,
            child: Image.network(widget.products.image.toString()),
          ),
          Text(widget.products.title ?? "no"),
          Text(widget.products.description ?? "no"),
          Text(widget.products.price.toString()),
          TextButton(
            onPressed: () {
              // addToCart(widget.products);
              Provider.of<CartProvider>(context, listen: false)
                  .addToCart(widget.products);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartPage(),
                  ));
            },
            style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.black)),
            child: const Text(
              "Add TO CART",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}

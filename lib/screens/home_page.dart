import 'dart:convert';

import 'package:fake_stroe/models/product_model.dart';
import 'package:fake_stroe/screens/view_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = true;

  List<ProductModel> products = [];
  void getProduct() async {
    const url = "https://fakestoreapi.com/products";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final body = response.body;
      final List<dynamic> json = jsonDecode(body);
      print(json);
      setState(() {
        products = json.map((e) => ProductModel.fromJson(e)).toList();
        isLoading = false;
        print(products.length);
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final getProduct = products[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ViewPage(products: products[index]),
                          ));
                    },
                    child: Card(
                      color: Colors.greenAccent,
                      child: ListTile(
                        title: Text(getProduct.title ?? "no data"),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(getProduct.description ?? "no des"),
                            Text("price:${getProduct.price.toString()}"),
                          ],
                        ),
                        leading: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Image.network(getProduct.image ?? ''),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}

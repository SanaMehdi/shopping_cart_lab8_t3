// lib/screens/product_list_page.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/cart_controller.dart';
import '../models/product.dart';

class ProductListPage extends StatelessWidget {
  final CartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Shopping Cart Products Lists'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () => Get.toNamed('/cart'),
          ),
        ],
      ),
      body: Obx(
            () => ListView.builder(
          itemCount: cartController.productList.length,
          itemBuilder: (context, index) {
            final product = cartController.productList[index];
            return ListTile(
              leading: Image.network(
                product.imageUrl,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.error, color: Colors.red);
                },
              ),

              title: Text(product.name),
              subtitle: Text('\$${product.price}'),
              trailing: IconButton(
                icon: const Icon(Icons.add_shopping_cart),
                onPressed: () {
                  cartController.addProductToCart(product);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

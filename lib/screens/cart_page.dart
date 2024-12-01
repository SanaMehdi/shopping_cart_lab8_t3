// lib/screens/cart_page.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/cart_controller.dart';

class CartPage extends StatelessWidget {
  final CartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
      ),
      body: Obx(
            () => cartController.cart.isEmpty
            ? const Center(child: Text('Your cart is empty!'))
            : Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cartController.cart.length,
                itemBuilder: (context, index) {
                  final product = cartController.cart[index];
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
                      icon: const Icon(Icons.remove_shopping_cart),
                      onPressed: () {
                        cartController.removeProductFromCart(product);
                      },
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total: \$${cartController.totalPrice.toStringAsFixed(2)}'),
                  ElevatedButton(
                    onPressed: () {
                      // Handle checkout
                    },
                    child: const Text('Checkout'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

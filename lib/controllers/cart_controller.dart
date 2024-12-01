// lib/controllers/cart_controller.dart

import 'package:get/get.dart';
import '../models/product.dart';

class CartController extends GetxController {
  var productList = <Product>[
    Product(name: 'Mango shake', price: 10.0, imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJjT7cbdKqsDepmmVNRtCnxozaB00TqaUm7Q&s'),
    Product(name: 'Strawberry Juice', price: 15.0, imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJt-vXQtNgRewjnunMqFv3LBDFXe_porfHPA&s'),
    Product(name: 'Mint Juice', price: 20.0, imageUrl: 'https://cheznermine.com/wp-content/uploads/2019/07/1-1.jpg'),
  ].obs;

  var cart = <Product>[].obs;

  void addProductToCart(Product product) {
    cart.add(product);
    Get.snackbar(
      'Cart Updated',
      '${product.name} added to the cart',
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 2),
    );
  }

  void removeProductFromCart(Product product) {
    cart.remove(product);
    Get.snackbar(
      'Cart Updated',
      '${product.name} removed from the cart',
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 2),
    );
  }


  double get totalPrice => cart.fold(0.0, (sum, item) => sum + item.price);
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/product.dart';
import '../theme/app_theme.dart';

class ProductController extends GetxController {
  var products = <Product>[].obs;
  var cartItems = <Product>[].obs;
  var searchQuery = RxString('');

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() {
    var productList = [
      Product(
        id: 1,
        name: 'Premium Wireless Headphones',
        price: 299.99,
        qty:1,
        description: 'High-quality wireless headphones with active noise cancellation, premium sound quality, and 30-hour battery life.',
        images: [
          'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=800',
          'https://images.unsplash.com/photo-1583394838336-acd977736f90?w=800',
        ],
      ),
      Product(
        id: 2,
        qty:1,
        name: 'Smart Watch Series X',
        price: 399.99,
        description: 'Advanced smartwatch with health tracking, ECG monitoring, and seamless connectivity.',
        images: [
          'https://images.unsplash.com/photo-1546868871-7041f2a55e12?w=800',
          'https://images.unsplash.com/photo-1508685096489-7aacd43bd3b1?w=800',
        ],
      ),
      Product(
        id: 3,
        name: 'Professional Camera Kit',
        price: 1299.99,
        qty:1,
        description: 'Professional-grade camera with 4K video capability and advanced autofocus system.',
        images: [
          'https://images.unsplash.com/photo-1516035069371-29a1b244cc32?w=800',
          'https://images.unsplash.com/photo-1502920917128-1aa500764cbd?w=800',
        ],
      ),
      Product(
        id: 4,
        name: 'Luxury Smartphone',
        price: 999.99,
        qty:1,
        description: 'Premium smartphone with advanced camera system and powerful performance.',
        images: [
          'https://images.unsplash.com/photo-1592899677977-9c10ca588bbd?w=800',
          'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=800',
        ],
      ),
    ];
    products.value = productList;
  }

  void addToCart(Product product) {
    cartItems.add(product);
    Get.snackbar(
      'Added to Cart',
      '${product.name} has been added to your cart',
      snackPosition: SnackPosition.TOP,
      backgroundColor: AppTheme.primaryColor.withOpacity(0.9),
      colorText: Colors.white,
      duration: Duration(seconds: 2),
    );
  }

  void removeFromCart(Product product) {
    cartItems.remove(product);
  }

  double get total => cartItems.fold(0, (sum, item) => sum + item.price);

}
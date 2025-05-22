import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductProvider with ChangeNotifier {
  final List<Product> _items = [
    Product(id: '1', title: 'T-Shirt', price: 19.99, category: 'Clothing'),
    Product(id: '2', title: 'Jeans', price: 39.99, category: 'Clothing'),
    Product(id: '3', title: 'Sneakers', price: 59.99, category: 'Footwear'),
    Product(id: '4', title: 'Hat', price: 14.99, category: 'Accessories'),
    Product(id: '5', title: 'Jacket', price: 79.99, category: 'Clothing'),
    Product(id: '6', title: 'Socks', price: 9.99, category: 'Clothing'),
  ];


  // final List<CartItem> _cartItems = [];
  // In product_provider.dart
  // List<CartItem> get cartItems => [..._cartItems];
  String? _currentCategory;
  String _searchQuery = '';

  List<Product> get items => [..._items];
  
  List<Product> get filteredItems {
    return _items.where((product) {
      final matchesSearch = product.title.toLowerCase().contains(_searchQuery.toLowerCase());
      final matchesCategory = _currentCategory == null || product.category == _currentCategory;
      return matchesSearch && matchesCategory;
    }).toList();
  }


  // int get cartItemCount => _cartItems.fold(0, (sum, item) => sum + item.quantity);

  List<String> get categories => ['Clothing', 'Accessories', 'Footwear'];

  String? get currentCategory => _currentCategory;
  String get searchQuery => _searchQuery;

  // void addToCart(String productId) {
  //   final existingIndex = _cartItems.indexWhere((item) => item.productId == productId);
  //   if (existingIndex >= 0) {
  //     _cartItems[existingIndex].quantity++;
  //   } else {
  //     _cartItems.add(CartItem(
  //       productId: productId,
  //       quantity: 1,
  //     ));
  //   }
  //   notifyListeners();
  // }

  void setCategory(String? category) {
    _currentCategory = category;
    notifyListeners();
  }

  void searchProducts(String query) {
    _searchQuery = query;
    notifyListeners();
  }
}

class CartItem {
  final String productId;
  int quantity;

  CartItem({
    required this.productId,
    required this.quantity,
  });
}
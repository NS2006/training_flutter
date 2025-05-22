class CartItem {
  final String id;
  final String title;
  int quantity;
  final double price;

  CartItem({
    required this.id,
    required this.title,
    this.quantity = 1,
    required this.price,
  });
}

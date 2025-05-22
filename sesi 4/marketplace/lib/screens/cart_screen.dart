import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart.dart';
import '../providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
        actions: [
          if (cartProvider.itemCount > 0)
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => _showClearCartDialog(context, cartProvider),
            ),
        ],
      ),
      body: Stack(
        children: [
          // Main Content
          Column(
            children: [
              // Summary Cards
              if (cartProvider.itemCount > 0) ...[
                _buildSummaryCard(
                  context,
                  'Total Items:',
                  cartProvider.totalQuantity.toString(),
                ),
                _buildSummaryCard(
                  context,
                  'Total Price:',
                  '\$${cartProvider.totalPrice.toStringAsFixed(2)}',
                  isPrice: true,
                ),
              ],
              
              // Cart Items List or Empty State
              Expanded(
                child: cartProvider.itemCount == 0
                    ? _buildEmptyCartState(context)
                    : _buildCartItemsList(context, cartProvider),
              ),
            ],
          ),
          
          // Checkout Button (positioned at bottom)
          if (cartProvider.itemCount > 0)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: _buildCheckoutButton(context),
            ),
        ],
      ),
    );
  }

  // Helper Methods

  void _showClearCartDialog(BuildContext context, CartProvider cartProvider) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Clear Cart?'),
        content: const Text('Do you want to remove all items from your cart?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              cartProvider.clearCart();
              Navigator.of(ctx).pop();
            },
            child: const Text('Clear'),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryCard(
    BuildContext context,
    String title,
    String value, {
    bool isPrice = false,
  }) {
    final theme = Theme.of(context);
    
    return Card(
      margin: EdgeInsets.fromLTRB(16, 16, 16, isPrice ? 16 : 0),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: theme.textTheme.titleMedium,
            ),
            Text(
              value,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: isPrice ? theme.colorScheme.primary : null,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyCartState(BuildContext context) {
    final theme = Theme.of(context);
    
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_cart_outlined,
            size: 64,
            color: theme.colorScheme.outline,
          ),
          const SizedBox(height: 16),
          Text(
            'Your cart is empty',
            style: theme.textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          Text(
            'Browse products and add items to your cart',
            style: theme.textTheme.bodyMedium,
          ),
          const SizedBox(height: 16),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Continue Shopping'),
          ),
        ],
      ),
    );
  }

  Widget _buildCartItemsList(BuildContext context, CartProvider cartProvider) {
    final theme = Theme.of(context);
    
    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 100), // Space for checkout button
      itemCount: cartProvider.items.length,
      itemBuilder: (ctx, i) {
        final item = cartProvider.items[i];
        return _buildCartItem(context, item, cartProvider);
      },
    );
  }

  Widget _buildCartItem(
    BuildContext context,
    CartItem item,
    CartProvider cartProvider,
  ) {
    final theme = Theme.of(context);
    
    return Dismissible(
      key: ValueKey(item.id),
      background: Container(
        color: theme.colorScheme.error,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        child: Icon(
          Icons.delete,
          color: theme.colorScheme.onError,
        ),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) async {
        return await _showRemoveItemDialog(context);
      },
      onDismissed: (direction) => cartProvider.removeItem(item.id),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: theme.colorScheme.primaryContainer,
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: FittedBox(
                  child: Text(
                    '\$${item.price}',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.onPrimaryContainer,
                    ),
                  ),
                ),
              ),
            ),
            title: Text(item.title),
            subtitle: Text('Price: \$${item.price.toStringAsFixed(2)}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.remove, color: theme.colorScheme.error),
                  onPressed: () => cartProvider.removeSingleItem(item.id),
                ),
                Text(item.quantity.toString()),
                IconButton(
                  icon: Icon(Icons.add, color: theme.colorScheme.primary),
                  onPressed: () => cartProvider.addItem(
                    item.id, item.title, item.price),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool?> _showRemoveItemDialog(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Remove Item?'),
        content: const Text('Do you want to remove this item from your cart?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            child: const Text('Remove'),
          ),
        ],
      ),
    );
  }

  Widget _buildCheckoutButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        children: [
          const Divider(height: 1),
          const SizedBox(height: 16),
          FilledButton(
            style: FilledButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Proceeding to checkout...'),
                ),
              );
            },
            child: const Text('PROCEED TO CHECKOUT'),
          ),
        ],
      ),
    );
  }
}
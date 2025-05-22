// screens/product_list_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../providers/product_provider.dart' show ProductProvider;
import '../widgets/product_item.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);


    return Scaffold(
      appBar: AppBar(
        title: const Text('Marketplace'),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () => Navigator.pushNamed(context, '/cart'),
              ),
              if (cartProvider.itemCount > 0)
                Positioned(
                  right: 8,
                  top: 8,
                  child: CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.error,
                    radius: 10,
                    child: Text(
                      cartProvider.totalQuantity.toString(),
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16),
            child: SearchBar(
              hintText: 'Search products...',
              leading: const Icon(Icons.search),
              onChanged: (value) {
                productProvider.searchProducts(value);
              },
            ),
          ),
          
          // Category Chips
          SizedBox(
            height: 60,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              children: [
                const SizedBox(width: 8),
                FilterChip(
                  label: const Text('All'),
                  selected: productProvider.currentCategory == null,
                  onSelected: (_) => productProvider.setCategory(null),
                ),
                ...productProvider.categories.map((category) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: FilterChip(
                      label: Text(category),
                      selected: productProvider.currentCategory == category,
                      onSelected: (_) => productProvider.setCategory(category),
                    ),
                  );
                }).toList(),
              ],
            ),
          ),
          
          // Product Grid
Expanded(
  child: productProvider.filteredItems.isEmpty
      ? Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.search_off,
                size: 64,
                color: Colors.grey.shade400,
              ),
              const SizedBox(height: 16),
              Text(
                'No products found',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey.shade600,
                ),
              ),
              if (productProvider.currentCategory != null ||
                  productProvider.searchQuery.isNotEmpty)
                TextButton.icon(
                  onPressed: () {
                    productProvider.setCategory(null);
                    productProvider.searchProducts('');
                  },
                  icon: const Icon(Icons.clear),
                  label: const Text('Clear filters'),
                ),
            ],
          ),
        )
      : GridView.builder(
          padding: const EdgeInsets.all(12),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2,
            crossAxisSpacing: 4,
            mainAxisSpacing: 4,
          ),
          itemCount: productProvider.filteredItems.length,
          itemBuilder: (ctx, i) {
            final product = productProvider.filteredItems[i];
            return Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '\$${product.price.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    const Spacer(),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton(
                        onPressed: () {
                          Provider.of<CartProvider>(ctx, listen: false).addItem(
                            product.id,
                            product.title,
                            product.price,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text('Add'),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        ),

        ],
      ),
    );
  }
}